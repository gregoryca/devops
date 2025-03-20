variable "name" {
  type    = string
  default = "pihole-pve-vm"
}

#verwijst naar huis
variable "template" {
  type        = string
  default     = "DevOps-template"
  description = "DNS Name for traefik dashboard - home"
}

#verwijst naar huis
variable "node" {
  type        = string
  default     = "pve"
  description = "DNS Name for traefik dashboard - home"
}

#verwijst naar huis
variable "cores" {
  type        = number
  default     = 2
  description = "amount of cores assigned to vm"
}

#verwijst naar huis
variable "memory" {
  type        = number
  default     = 2048
  description = "DNS Name for traefik dashboard - home"
}

variable "api_url" {
}

variable "token_secret" {
}

variable "token_id" {
}