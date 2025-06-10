token_secret = "ed876a2c-3dd1-491b-911c-97182dba4f45"
token_id     = "terraform@pam!Terraform"
api_url      = "https://192.168.2.120:8006/api2/json"
#ansible vars
ansible_ssh_user             = "root"
ansible_ssh_private_key_file = "~/.ssh/id_rsa"
ansible_sudo_pass            = "laliloe"
#docker vars
docker_stack_name = "nextcloud-proxmox-vm"
docker_image      = "nextcloud:latest"
state             = "absent"
sources           = "pull"
#vm vars
hostname = "pve"
#tailscale vars
auth_key = "6c472f5299e20fcfbddeb8b00f24ec7e6cf012509e2212ac"