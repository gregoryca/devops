terraform {
  required_providers {
    ansible = {
      source = "ansible/ansible"
      version = "1.1.0"
    }
  }
}

resource "ansible_host" "test_vm"  {
    name = "vm-01"
    groups = ["kubernetes"]
    variables = {
        ansible_user = "server"
        ansible_ssh_private_key_file = "~/.ssh/id_rsa"
    }
}

# resource "ansible_playbook" "playbook" {
#   playbook   = "~/srv/devops/kubernetes/ping.yml"
#   name       = "vm-01.local"
#   replayable = true

#   # extra_vars = {
#   #   var_a = "Some variable"
#   #   var_b = "Another variable"
#   # }
# }