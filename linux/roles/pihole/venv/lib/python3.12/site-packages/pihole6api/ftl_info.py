class PiHole6FtlInfo:
    def __init__(self, connection):
        """
        Handles Pi-hole FTL and system diagnostics API endpoints.
        :param connection: Instance of PiHole6Connection for API requests.
        """
        self.connection = connection

    def get_endpoints(self):
        """Retrieve a list of all available API endpoints."""
        return self.connection.get("endpoints")

    def get_client_info(self):
        """Retrieve information about the requesting client."""
        return self.connection.get("info/client")

    def get_database_info(self):
        """Retrieve long-term database statistics."""
        return self.connection.get("info/database")

    def get_ftl_info(self):
        """Retrieve various FTL parameters."""
        return self.connection.get("info/ftl")

    def get_host_info(self):
        """Retrieve various host parameters."""
        return self.connection.get("info/host")

    def get_login_info(self):
        """Retrieve login page related information."""
        return self.connection.get("info/login")

    def get_diagnosis_messages(self):
        """Retrieve all Pi-hole diagnosis messages."""
        return self.connection.get("info/messages")

    def delete_diagnosis_message(self, message_id):
        """
        Delete a specific Pi-hole diagnosis message.

        :param message_id: ID of the diagnosis message to delete.
        """
        return self.connection.delete(f"info/messages/{message_id}")

    def get_diagnosis_message_count(self):
        """Retrieve the count of Pi-hole diagnosis messages."""
        return self.connection.get("info/messages/count")

    def get_metrics_info(self):
        """Retrieve various system metrics."""
        return self.connection.get("info/metrics")

    def get_sensors_info(self):
        """Retrieve various sensor data."""
        return self.connection.get("info/sensors")

    def get_system_info(self):
        """Retrieve various system parameters."""
        return self.connection.get("info/system")

    def get_version(self):
        """Retrieve Pi-hole version details."""
        return self.connection.get("info/version")

    def get_dnsmasq_logs(self, next_id=None):
        """
        Retrieve DNS log content from the embedded DNS resolver (dnsmasq).

        :param next_id: Optional ID to fetch only new log lines since the last request.
        """
        params = {"nextID": next_id} if next_id is not None else {}
        return self.connection.get("logs/dnsmasq", params=params)


    def get_ftl_logs(self, next_id=None):
        """
        Retrieve FTL log content.
        
        :param next_id: Optional ID to fetch only new log lines since the last request.
        """
        params = {"nextID": next_id} if next_id is not None else {}
        return self.connection.get("logs/ftl", params=params)

    def get_webserver_logs(self, next_id=None):
        """
        Retrieve webserver log content.
        
        :param next_id: Optional ID to fetch only new log lines since the last request.
        """
        params = {"nextID": next_id} if next_id is not None else {}
        return self.connection.get("logs/webserver", params=params)
