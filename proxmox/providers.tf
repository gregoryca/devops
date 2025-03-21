terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
    
    transip = {
      source  = "aequitas/transip"
      version = "0.1.22"
    }
  }

  backend "http" {
    lock_address   = "https://terraform-backend.apex-migrations.net/s/pve-pihole/"
    unlock_address = "https://terraform-backend.apex-migrations.net/s/pve-pihole/"
    address        = "https://terraform-backend.apex-migrations.net/s/pve-pihole/"
  }
}

provider "proxmox" {
  # References our vars.tf file to plug in the api_url 
  pm_api_url = var.api_url
  # References our secrets.tfvars file to plug in our token_id
  pm_api_token_id = var.token_id
  # References our secrets.tfvars to plug in our token_secret 
  pm_api_token_secret = var.token_secret
  # Default to `true` unless you have TLS working within your pve setup 
  pm_tls_insecure = true
}

provider "transip" {
  account_name = "gregoryacdevops"
  private_key  = var.private_key
}