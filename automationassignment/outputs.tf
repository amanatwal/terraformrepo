output "resource_group_name" {
  value = module.rgroup.resource_group_name
}

output "network_name" {
  value = module.network.network_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "nsg_name" {
  value = module.network.nsg_name
}

output "subnet1_address_space" {
  value = module.network.subnet1_address_space
}

output "network_address_space" {
  value = module.network.network_address_space
}

output "subnet1_id" {
  value = module.network.subnet1_id
}

output "nsg1_id" {
  value = module.network.nsg1_id
}

output "storage_account_name" {
  value = module.common.storage_account_name
}

output "la_workspace_name" {
  value = module.common.la_workspace_name
}

output "recovery_vault_name" {
  value = module.common.recovery_vault_name
}

output "primary_blob_endpoint" {
  value = module.common.primary_blob_endpoint
}

output "vm1_hostname" {
  value = module.vmlinux.vm_name
}

output "vm1_private_ip" {
  value = module.vmlinux.vm1_private_ip
}

output "vm1_public_ip" {
  value = module.vmlinux.vm1_public_ip
}

output "vm2_hostname" {
  value = module.vmlinux.vm2_name
}

output "vm2_public_ip" {
  value = module.vmlinux.vm2_public_ip
}

output "vm2_private_ip" {
  value = module.vmlinux.vm2_private_ip
}

output "Windows_hostname" {
  value = module.vmwindows.Windows_hostname
}

output "Windows_public_ip_addresses" {
  value = module.vmwindows.Windows_public_ip_addresses
}

output "Windows_private_ip_address" {
  value = module.vmwindows.Windows_private_ip_address
}

output "Windows_dns" {
  value = module.vmwindows.Windows_dns
}

output "linux_datadisk1_ids" {
  value = module.datadisk.linux_datadisk1_ids
}

output "windows_datadisk1_id" {
  value = module.datadisk.windows_datadisk1_id
}

output "loadbalancer_name" {
  value = module.loadbalancer.loadbalancer_name
}

output "loadbalancer_public_ip_address" {
  value = module.loadbalancer.loadbalancer_public_ip_address
}

output "postgresql_server_name" {
  value       = module.database.postgresql_server_name
}
