# module "vm" {
#   source = "./vm"
# }

module "domain" {
  source = "./transip"
}

module "ansible" {
  source                       = "./ansible"
  ansible_ssh_user             = var.ansible_ssh_user
  ansible_ssh_private_key_file = var.ansible_ssh_private_key_file
  ansible_sudo_pass            = var.ansible_sudo_pass
  docker_stack_name            = var.docker_stack_name
  docker_image                 = var.docker_image
  state                        = var.state
  sources                      = var.sources
  hostname                     = var.hostname
  auth_key                     = var.auth_key
}