terraform {
  required_providers {                     #### ansible provider
    ansible = {
      version = "~> 1.3.0"
      source  = "ansible/ansible"
    }
  }
}

variable "ansible_ssh_user" {
    description = ""
}

variable "ansible_ssh_private_key_file" {
    description = ""
}

variable "ansible_sudo_pass" {
    description = ""
}

variable "docker_stack_name" {
    description = ""
}

variable "docker_image" {
    description = ""
}

variable "state" {
    description = ""
}

variable "sources" {
    description = ""
}

variable "hostname" {
    description = ""
}

variable "auth_key" {
    description = ""
}

resource "ansible_group" "web" {
  name     = "web"
  children = ["home"]

  # Group variables that will apply to the children hosts.
    variables = {
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
}

resource "ansible_host" "vm" {          #### ansible host details
  name   = "terraform-ansible-proxmox-vm"
  groups = ["home"]
  
    variables = {
        ansible_ssh_user=var.ansible_ssh_user
        ansible_ssh_private_key_file=var.ansible_ssh_private_key_file
        ansible_sudo_pass=var.ansible_sudo_pass
        docker_stack_name=var.docker_stack_name
        docker_image=var.docker_image
        state=var.state
        sources=var.sources
        hostname=var.hostname
        auth_key=var.auth_key
    }
}
