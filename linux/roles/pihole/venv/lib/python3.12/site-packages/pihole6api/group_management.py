class PiHole6GroupManagement:
    def __init__(self, connection):
        """
        Handles Pi-hole group management API endpoints.
        :param connection: Instance of PiHole6Connection for API requests.
        """
        self.connection = connection

    def add_group(self, name, comment=None, enabled=True):
        """
        Create a new group.

        :param name: Name of the new group (string or list of strings).
        :param comment: Optional comment describing the group.
        :param enabled: Whether the group is enabled (default: True).
        """
        payload = {
            "name": name if isinstance(name, list) else [name],
            "comment": comment,
            "enabled": enabled
        }
        return self.connection.post("groups", data=payload)

    def batch_delete_groups(self, group_names):
        """
        Delete multiple groups.

        :param group_names: List of group names to delete.
        """
        if not isinstance(group_names, list):
            raise ValueError("group_names must be a list of group names.")
        
        payload = [{"item": name} for name in group_names]
        return self.connection.post("groups:batchDelete", data=payload)


    def get_group(self, name):
        """
        Retrieve information about a specific group.

        :param name: Name of the group to fetch.
        """
        return self.connection.get(f"groups/{name}")
    
    def get_groups(self):
        """
        Retrieve information about all groups.
        """
        return self.connection.get("groups")

    def update_group(self, name, new_name=None, comment=None, enabled=True):
        """
        Update or rename an existing group.

        :param name: Current name of the group.
        :param new_name: New name for the group (optional).
        :param comment: Updated comment for the group (optional).
        :param enabled: Whether the group is enabled (default: True).
        """
        payload = {
            "name": new_name if new_name else name,
            "comment": comment,
            "enabled": enabled
        }
        return self.connection.put(f"groups/{name}", data=payload)

    def delete_group(self, name):
        """
        Delete a group.

        :param name: Name of the group to delete.
        """
        return self.connection.delete(f"groups/{name}")
