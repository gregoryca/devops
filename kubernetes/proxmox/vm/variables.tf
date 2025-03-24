#verwijst naar huis
variable "name" {
  type = string
  default = "test-vm"
}

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

variable "os_type" {
  type = string
  default = "cloud-init"
}

variable "cpu_type" {
  type = string
  default = "host"
}

variable "nameserver" {
  type = string
  default = "192.168.2.101"
}