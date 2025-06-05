class PiHole6Dhcp:
    def __init__(self, connection):
        """Handles Pi-hole DHCP API endpoints."""
        self.connection = connection

    def get_leases(self):
        """
        Retrieve currently active DHCP leases.

        :return: API response containing active DHCP leases.
        """
        return self.connection.get("dhcp/leases")

    def remove_lease(self, ip):
        """
        Remove a specific DHCP lease by IP address.

        :param ip: The IP address of the lease to remove.
        :return: API response confirming removal.
        """
        return self.connection.delete(f"dhcp/leases/{ip}")
