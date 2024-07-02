resource "harvester_virtualmachine" "rancher" {
  name        = var.name_1
  namespace   = var.namespace_1
  description = var.description_1

  hostname    = var.hostname_1

  tags        = var.tags_1

  cpu         = var.cpus_1
  memory      = var.memory_1

  run_strategy = "RerunOnFailure"
  restart_after_update = true
  machine_type = "q35"

  #efi         = true
  #secure_boot = false

  disk {
    name        = var.disk_name_1
    type        = "disk"
    size        = var.disk_size_1
    bus         = "virtio"
    boot_order  = var.disk_boot_order_1
    image       = data.harvester_image.suse_iso.id
    auto_delete = true
  }

#  disk {
#    name        = var.disk_name_2
#    type        = "disk"
#    size        = var.disk_size_2
#    bus         = "virtio"
#    boot_order  = var.disk_boot_order_2
#    auto_delete = true
#  }
  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]

    connection {
      type        = "ssh"
#      host        = self.network_interface[0].ip_address
#     host        = self.network_interface.0.ip_address
#      host        = "${var.ip_1}"
      host        = self.network_interface[index(self.network_interface.*.name, "default")].ip_address
      user        = "kaio"
      private_key = tls_private_key.rsa_key.private_key_pem
#      password    = "admin"
    }
  }
  ssh_keys = []
  
  network_interface {
    name           = "default"
    network_name   = data.harvester_network.vm_network.id
    wait_for_lease = true
  }  
  cloudinit {
    type = "noCloud"
    user_data_secret_name = "cloud-config-rancher"
    network_data = <<-EOF
    version: 2
    ethernets:
      eth0:
        dhcp4: true
#        addresses:
#          - ${var.ip_1} 
        gateway4: ${var.gateway}
        nameservers:
          addresses: ${var.nameserver}
    EOF
 }
}
