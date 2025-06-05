class PiHole6Actions:
    def __init__(self, connection):
        """Handles Pi-hole system action API endpoints."""
        self.connection = connection

    def flush_arp(self):
        """Flush the network table (ARP cache)."""
        return self.connection.post("action/flush/arp")

    def flush_logs(self):
        """Flush the DNS logs."""
        return self.connection.post("action/flush/logs")

    def run_gravity(self):
        """Run gravity (updates blocklists and reprocesses them)."""
        return self.connection.post("action/gravity")

    def restart_dns(self):
        """Restart the Pi-hole FTL DNS resolver."""
        return self.connection.post("action/restartdns")
