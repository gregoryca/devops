class PiHole6DomainManagement:
    def __init__(self, connection):
        """
        Handles Pi-hole domain management API endpoints.
        :param connection: Instance of PiHole6Connection for API requests.
        """
        self.connection = connection

    def batch_delete_domains(self, domains):
        """
        Delete multiple domains.

        :param domains: List of dictionaries with keys "item", "type", and "kind".
                        Example: [{"item": "example.com", "type": "allow", "kind": "exact"}]
        """
        if not isinstance(domains, list):
            raise ValueError("domains must be a list of dictionaries.")

        return self.connection.post("domains:batchDelete", data=domains)

    def add_domain(self, domain, domain_type, kind, comment=None, groups=None, enabled=True):
        """
        Add a new domain to Pi-hole.

        :param domain: Domain name (string or list of strings)
        :param domain_type: Type of domain ("allow" or "deny")
        :param kind: Kind of domain ("exact" or "regex")
        :param comment: Optional comment for the domain
        :param groups: Optional list of group IDs
        :param enabled: Whether the domain is enabled (default: True)
        """
        if domain_type not in ["allow", "deny"]:
            raise ValueError("domain_type must be 'allow' or 'deny'.")
        if kind not in ["exact", "regex"]:
            raise ValueError("kind must be 'exact' or 'regex'.")

        payload = {
            "domain": domain if isinstance(domain, list) else [domain],
            "comment": comment,
            "groups": groups if groups else [],
            "enabled": enabled
        }

        return self.connection.post(f"domains/{domain_type}/{kind}", data=payload)

    def get_domain(self, domain, domain_type, kind):
        """
        Retrieve information about a specific domain.

        :param domain: Domain name
        :param domain_type: Type of domain ("allow" or "deny")
        :param kind: Kind of domain ("exact" or "regex")
        """
        return self.connection.get(f"domains/{domain_type}/{kind}/{domain}")

    def update_domain(self, domain, domain_type, kind, new_type=None, new_kind=None, comment=None, groups=None, enabled=True):
        """
        Update or move an existing domain entry.

        :param domain: Domain name
        :param domain_type: Current type of domain ("allow" or "deny")
        :param kind: Current kind of domain ("exact" or "regex")
        :param new_type: New type of domain (optional)
        :param new_kind: New kind of domain (optional)
        :param comment: Updated comment (optional)
        :param groups: Updated list of group IDs (optional)
        :param enabled: Whether the domain is enabled (default: True)
        """
        payload = {
            "type": new_type if new_type else domain_type,
            "kind": new_kind if new_kind else kind,
            "comment": comment,
            "groups": groups if groups else [],
            "enabled": enabled
        }

        return self.connection.put(f"domains/{domain_type}/{kind}/{domain}", data=payload)

    def delete_domain(self, domain, domain_type, kind):
        """
        Delete a single domain.

        :param domain: Domain name
        :param domain_type: Type of domain ("allow" or "deny")
        :param kind: Kind of domain ("exact" or "regex")
        """
        return self.connection.delete(f"domains/{domain_type}/{kind}/{domain}")
