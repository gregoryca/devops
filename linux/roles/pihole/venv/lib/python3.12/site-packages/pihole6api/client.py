from .conn import PiHole6Connection
from .metrics import PiHole6Metrics
from .dns_control import PiHole6DnsControl
from .group_management import PiHole6GroupManagement
from .domain_management import PiHole6DomainManagement
from .client_management import PiHole6ClientManagement
from .list_management import PiHole6ListManagement
from .ftl_info import PiHole6FtlInfo
from .config import PiHole6Configuration
from .network_info import PiHole6NetworkInfo
from .actions import PiHole6Actions
from .dhcp import PiHole6Dhcp

class PiHole6Client:
    def __init__(self, base_url, password):
        """
        Initialize the Pi-hole client wrapper.

        :param base_url: Pi-hole API base URL
        :param password: Pi-hole password (or application password)
        """
        self.connection = PiHole6Connection(base_url, password)

        # Attach API Modules
        self.metrics = PiHole6Metrics(self.connection)
        self.dns_control = PiHole6DnsControl(self.connection)
        self.group_management = PiHole6GroupManagement(self.connection)
        self.domain_management = PiHole6DomainManagement(self.connection)
        self.client_management = PiHole6ClientManagement(self.connection)
        self.list_management = PiHole6ListManagement(self.connection)
        self.ftl_info = PiHole6FtlInfo(self.connection)
        self.config = PiHole6Configuration(self.connection)
        self.network_info = PiHole6NetworkInfo(self.connection)
        self.actions = PiHole6Actions(self.connection)
        self.dhcp = PiHole6Dhcp(self.connection)

    def get_padd_summary(self, full=False):
        """
        Get summarized data for PADD.

        :param full: Boolean flag to get the full dataset.
        :return: API response containing PADD summary.
        """
        return self.connection.get("padd", params={"full": str(full).lower()})
    
    def close_session(self):
        """Close the Pi-hole session by calling the exit method in the connection."""
        return self.connection.exit()