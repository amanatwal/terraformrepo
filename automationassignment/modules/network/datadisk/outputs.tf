output "linux_datadisk1_ids" {
  value = azurerm_managed_disk.linux_disk1.*.id
}

output "windows_datadisk1_id" {
  value = azurerm_managed_disk.windows_disk1.id
}
