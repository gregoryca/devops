terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "pxe-vm" {
    name                      = "vm-01"
    desc                      = "A test VM for PXE boot mode."
# PXE option enables the network boot feature
    # pxe                       = false
    clone                     = var.template
# unless your PXE installed system includes the Agent in the installed
# OS, do not use this, especially for PXE boot VMs
    agent                     = 0
    automatic_reboot          = true
    balloon                   = 0
    bios                      = "seabios"
# boot order MUST include network, this is enforced in the Provider
# Optinally, setting a disk first means that PXE will be used first boot
# and future boots will run off the disk
    boot                      = "order=scsi0"
    cores                     = 2
    cpu                       = "host"
    define_connection_info    = true
    force_create              = false
    hotplug                   = "disk,usb,network"
    kvm                       = true
    memory                    = 2048
    numa                      = false
    onboot                    = false
    vm_state                  = "running"
    os_type                   = "cloud-init"
    # qemu_os                   = "l26"
    scsihw                    = "virtio-scsi-single"
    sockets                   = 1
    protection                = false
    tablet                    = true
    target_node               = "pve"
    vcpus                     = 0
    nameserver                = var.nameserver
    sshkeys                   = file("~/.ssh/id_rsa.pub")

    disks {
        scsi {
            scsi0 {
                disk {
                    backup             = true
                    cache              = "writeback"
                    discard            = true
                    iothread           = true
                    replicate          = true
                    size               = 64
                    storage            = "local-lvm"
                }
            }
        }
    }

    network {
        model           = "virtio"
        bridge          = "vmbr0"
    }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

#   #provisioner "local-exec" {
#     # Provisioner commands can be run here.
#     # We will use provisioner functionality to kick off ansible
#     # playbooks in the future
#     #command = "touch /home/tcude/test.txt"
#   #}
}