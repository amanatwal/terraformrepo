output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "vm2_id" {
  value = azurerm_linux_virtual_machine.vm2.id
}

output "vm2_name" {
  value = azurerm_linux_virtual_machine.vm2.name
}

output "vm1_public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "vm2_public_ip" {
  value = azurerm_public_ip.public_ip2.ip_address
}

output "availability_set_id" {
  value = azurerm_availability_set.avail_set.id
}

output "vm1_private_ip" {
  description = "Private IP address of the first virtual machine"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "vm2_private_ip" {
  description = "Private IP address of the second virtual machine"
  value       = azurerm_network_interface.nic2.private_ip_address
}

output "vm1_nic_id" {
  value = azurerm_network_interface.nic.id
}

output "vm2_nic_id" {
  value = azurerm_network_interface.nic2.id
}