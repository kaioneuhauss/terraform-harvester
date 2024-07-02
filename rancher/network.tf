#We use an exiting network.
#Use a resource block if you need to create a custom one
data "harvester_network" "vm_network" {
  name      = "vlan-vm"
  namespace = "vlan"
}

