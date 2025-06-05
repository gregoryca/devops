import requests
import urllib3
from urllib.parse import urljoin
import warnings
import time
import json

# Suppress InsecureRequestWarning
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
warnings.simplefilter("ignore", category=urllib3.exceptions.InsecureRequestWarning)

class PiHole6Connection:
    def __init__(self, base_url, password):
        """
        Initialize the Pi-hole connection client.

        :param base_url: The base URL of the Pi-hole API (e.g., "http://pi.hole/api/")
        :param password: The password for authentication (or an application password)
        """
        self.base_url = base_url.rstrip("/") + "/api/"
        self.password = password
        self.session_id = None
        self.csrf_token = None
        self.validity = None

        # Authenticate upon initialization
        self._authenticate()

    def _authenticate(self):
        """Authenticate with the Pi-hole API and store session ID and CSRF token.
        
        Retries up to three times (with a one-second pause between attempts)
        before raising an exception.
        """
        auth_url = urljoin(self.base_url, "auth")
        payload = {"password": self.password}
        max_attempts = 3
        last_exception = None

        for attempt in range(1, max_attempts + 1):
            response = requests.post(auth_url, json=payload, verify=False)
            try:
                if response.status_code == 200:
                    data = response.json()
                    if "session" in data and data["session"]["valid"]:
                        self.session_id = data["session"]["sid"]
                        self.csrf_token = data["session"]["csrf"]
                        self.validity = data["session"]["validity"]
                        return  # Successful authentication
                    else:
                        last_exception = Exception("Authentication failed: Invalid session response")
                else:
                    # Try to extract an error message from the response
                    try:
                        error_msg = response.json().get("error", {}).get("message", "Unknown error")
                    except (json.decoder.JSONDecodeError, ValueError):
                        error_msg = f"HTTP {response.status_code}: {response.reason}"
                    last_exception = Exception(f"Authentication failed: {error_msg}")
            except Exception as e:
                last_exception = e

            if attempt < max_attempts:
                time.sleep(1)  # Pause before retrying

        # All attempts failed; raise the last captured exception.
        raise last_exception

    def _get_headers(self):
        """Return headers including the authentication SID and CSRF token."""
        if not self.session_id or not self.csrf_token:
            self._authenticate()

        return {
            "X-FTL-SID": self.session_id,
            "X-FTL-CSRF": self.csrf_token
        }

    def _do_call(self, method, endpoint, params=None, data=None, files=None, is_binary=False):
        """Internal method to send an authenticated request to the Pi-hole API."""
        url = f"{self.base_url}{endpoint}"
        headers = self._get_headers()

        # Convert dictionary to form-encoded string if sending multipart
        request_data = None if files else data
        form_data = data if files else None  # Ensure correct encoding

        response = requests.request(
            method,
            url,
            headers=headers,
            params=params,
            json=request_data,
            files=files,
            data=form_data,
            verify=False
        )

        if response.status_code == 401:
            self._authenticate()
            headers = self._get_headers()
            response = requests.request(
                method,
                url,
                headers=headers,
                params=params,
                json=request_data,
                files=files,
                data=form_data,
                verify=False
            )

        # Handle 4xx responses gracefully
        if 400 <= response.status_code < 500:
            try:
                return response.json()
            except requests.exceptions.JSONDecodeError:
                return {"error": f"HTTP {response.status_code}: {response.reason}"}

        response.raise_for_status()

        if is_binary:
            return response.content  # Return raw binary content (e.g., for file exports)

        if not response.content.strip():
            return {}  # Handle empty response

        try:
            return response.json()  # Attempt to parse JSON
        except requests.exceptions.JSONDecodeError:
            return response.text  # Return raw text as fallback

    def get(self, endpoint, params=None, is_binary=False):
        """Send a GET request."""
        return self._do_call("GET", endpoint, params=params, is_binary=is_binary)

    def post(self, endpoint, data=None, files=None):
        """Send a POST request."""
        return self._do_call("POST", endpoint, data=data, files=files)

    def put(self, endpoint, data=None):
        """Send a PUT request."""
        return self._do_call("PUT", endpoint, data=data)

    def delete(self, endpoint, params=None, data=None):
        """Send a DELETE request."""
        return self._do_call("DELETE", endpoint, params=params, data=data)

    def patch(self, endpoint, data=None):
        """Send a PATCH request."""
        return self._do_call("PATCH", endpoint, data=data)
    
    def exit(self):
        """Delete the current session."""
        response = self.delete("auth")

        # Clear stored session info
        self.session_id = None
        self.csrf_token = None
        self.validity = None

        return response