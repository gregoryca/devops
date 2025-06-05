class PiHole6DnsControl:
    def __init__(self, connection):
        """
        Handles Pi-hole DNS control API endpoints.
        :param connection: Instance of PiHole6Connection for API requests.
        """
        self.connection = connection

    def get_blocking_status(self):
        """Get current blocking status."""
        return self.connection.get("dns/blocking")

    def set_blocking_status(self, blocking: bool, timer: int = None):
        """
        Change current blocking status.

        :param blocking: True to enable blocking, False to disable blocking.
        :param timer: (Optional) Set a timer in seconds. If None, change is permanent.
        """
        payload = {"blocking": blocking}
        if timer is not None:
            payload["timer"] = timer

        return self.connection.post("dns/blocking", data=payload)
