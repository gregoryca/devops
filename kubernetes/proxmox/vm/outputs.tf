output "instance_ip_addr" {
  value = proxmox_vm_qemu.pxe-vm.default_ipv4_address
}

output "vm-id" {
    value = proxmox_vm_qemu.pxe-vm.id
}