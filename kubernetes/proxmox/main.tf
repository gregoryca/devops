module "vm" {
  source = "./vm"
}

# module "domain" {
#   source = "./transip"
# }

module "ansible" {
  source = "./ansible"
  # depends_on = [
  #   module.vm
  # ]
}