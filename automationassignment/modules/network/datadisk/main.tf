resource "azurerm_managed_disk" "linux_disk1" {
  count = 2
  name                 = "linux-vm${count.index+1}-datadisk1"
  location             = var.location
  resource_group_name  = var.resource_group
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "linux_disk1_attachment" {
  count = 2
  managed_disk_id    = azurerm_managed_disk.linux_disk1[count.index].id
  virtual_machine_id = var.linux_vm_ids[count.index]
  lun                = "10"
  caching            = "ReadWrite"
}

resource "azurerm_managed_disk" "windows_disk1" {
  name                 = "windows-vm-datadisk1"
  location             = var.location
  resource_group_name  = var.resource_group
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "windows_disk1_attachment" {
  managed_disk_id    = azurerm_managed_disk.windows_disk1.id
  virtual_machine_id = var.windows_vm_id
  lun                = "10"
  caching            = "ReadWrite"
}
