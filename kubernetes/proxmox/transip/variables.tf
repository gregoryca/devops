####### Network
variable "node" {
  type        = string
  default     = "vm-01"
  description = "DNS Name for nextcloud"
}

variable "home" {
  type        = list(string)
  default     = ["apex-migrations.hopto.org."]
  description = "DDNS Record"
}