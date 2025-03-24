terraform {
  required_providers {
    transip = {
      source  = "aequitas/transip"
      version = "0.1.22"
    }
  }
}

data "transip_domain" "apex-migrations" {
  name = "apex-migrations.net"
}

resource "transip_dns_record" "node" {
  domain  = data.transip_domain.apex-migrations.id
  name    = var.node
  expire  = 300
  type    = "CNAME"
  content = var.home
}
