class PiHole6NetworkInfo:
    def __init__(self, connection):
        """Handles Pi-hole network information API endpoints."""
        self.connection = connection

    def get_devices(self, max_devices=None, max_addresses=None):
        """
        Get information about devices on the local network.

        :param max_devices: Optional maximum number of devices to show.
        :param max_addresses: Optional maximum number of addresses to show.
        """
        params = {}
        if max_devices is not None:
            params["max_devices"] = max_devices
        if max_addresses is not None:
            params["max_addresses"] = max_addresses

        return self.connection.get("network/devices", params=params)

    def delete_device(self, device_id):
        """
        Delete a device from the network table.

        :param device_id: The ID of the device to delete.
        """
        return self.connection.delete(f"network/devices/{device_id}")

    def get_gateway(self, detailed=False):
        """
        Get information about the gateway of the Pi-hole.

        :param detailed: Boolean flag to request detailed interface/routing information (default: False).
        """
        return self.connection.get("network/gateway", params={"detailed": detailed})

    def get_interfaces(self, detailed=False):
        """
        Get information about network interfaces of the Pi-hole.
        
        :param detailed: Boolean flag to request detailed interface/routing information (default: False).
        """
        return self.connection.get("network/interfaces", params={"detailed": detailed})

    def get_routes(self, detailed=False):
        """
        Get information about network routes of the Pi-hole.
        
        :param detailed: Boolean flag to request detailed interface/routing information (default: False).
        """
        return self.connection.get("network/routes", params={"detailed": detailed})
