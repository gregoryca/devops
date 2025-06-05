class PiHole6ClientManagement:
    def __init__(self, connection):
        """
        Handles Pi-hole client management API endpoints.
        :param connection: Instance of PiHole6Connection for API requests.
        """
        self.connection = connection

    def add_client(self, client, comment=None, groups=None):
        """
        Add a new client to Pi-hole.

        :param client: Client identifier (IP, MAC, hostname, or interface).
        :param comment: Optional comment for the client.
        :param groups: Optional list of group IDs.
        """
        payload = {
            "client": client if isinstance(client, list) else [client],
            "comment": comment,
            "groups": groups if groups else []
        }

        return self.connection.post("clients", data=payload)

    def batch_delete_clients(self, clients):
        """
        Delete multiple clients.

        :param clients: List of client identifiers (IP, MAC, hostname, or interface).
                        Example: [{"item": "192.168.1.100"}, {"item": "12:34:56:78:9A:BC"}]
        """
        if not isinstance(clients, list):
            raise ValueError("clients must be a list of dictionaries.")

        return self.connection.post("clients:batchDelete", data=clients)

    def get_client_suggestions(self):
        """
        Retrieve suggested client entries based on known devices.
        """
        return self.connection.get("clients/_suggestions")

    def get_client(self, client):
        """
        Retrieve information about a specific client.

        :param client: Client identifier (IP, MAC, hostname, or interface).
        """
        return self.connection.get(f"clients/{client}")
    
    def get_clients(self):
        """
        Retrieve information about all clients.
        """
        return self.connection.get(f"clients")

    def update_client(self, client, comment=None, groups=None):
        """
        Update an existing client.

        :param client: Client identifier (IP, MAC, hostname, or interface).
        :param comment: Updated comment (optional).
        :param groups: Updated list of group IDs (optional).
        """
        payload = {
            "comment": comment,
            "groups": groups if groups else []
        }

        return self.connection.put(f"clients/{client}", data=payload)

    def delete_client(self, client):
        """
        Delete a single client.

        :param client: Client identifier (IP, MAC, hostname, or interface).
        """
        return self.connection.delete(f"clients/{client}")
