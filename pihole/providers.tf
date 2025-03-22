terraform {
  required_providers {
    pihole = {
      source = "ryanwholey/pihole"
      version = "0.2.0"
    }
  }
}

provider "pihole" {
  url = "https://pihole.apex-migrations.net" # PIHOLE_URL

  # Requires Pi-hole Web Interface >= 5.11.0
  api_token = var.api_token # PIHOLE_API_TOKEN
}