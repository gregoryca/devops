terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "pihole-vm" {
  name        = "pihole-tf-vm"
  target_node = var.node
  clone       = var.template
  cores       = var.cores
  memory      = var.memory
  full_clone  = "true"

  # VM Settings. `agent = 1` enables qemu-guest-agent
  agent = 1
  os_type = "cloud-init"
  sockets = 1
  cpu = "host"
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "50G"
    type = "scsi"
    storage = "local-lvm" # Name of storage local to the host you are spinning the VM up on
    # Enables SSD emulation
    ssd = 1
    # Enables thin-provisioning
    discard = "on"
    #iothread = 1
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
    # tag = var.vlan_num # This tag can be left off if you are not taking advantage of VLANs
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  #provisioner "local-exec" {
    # Provisioner commands can be run here.
    # We will use provisioner functionality to kick off ansible
    # playbooks in the future
    #command = "touch /home/tcude/test.txt"
  #}
}
