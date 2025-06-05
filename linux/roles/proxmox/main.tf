# module "vm" {
#   source = "./vm"

#   api_url      = var.api_url
#   token_id     = var.token_id
#   token_secret = var.token_secret
# }

module "domain" {
  source = "./transip"
}