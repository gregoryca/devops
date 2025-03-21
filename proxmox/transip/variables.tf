####### Network
variable "pve" {
  type        = string
  default     = "pve"
  description = "DNS Name for nextcloud"
}

variable "home" {
  type        = list(string)
  default     = ["apex-migrations.hopto.org."]
  description = "DDNS Record"
}