module "rgroup" {
  source = "./modules/rg-group"
}

module "network" {
  source = "./modules/network"

  vnet_name    = "amandeep_vnet_name"
  vnet_space   = "10.0.0.0/16"
  subnet_name  = "amandeep_subnet_name"
  subnet_space = "10.0.1.0/24"
  nsg_name     = "amandeep_nsg_name"
  location     = "eastus"
  rgroup_name  = "n01261681-assignment1-RG"
  rg_dependency = module.rgroup

  tags = {
    Project       = "Automation Project – Assignment 1"
    Name          = "amandeep.kaur"
    ExpirationDate = "2023-06-30"
    Environment   = "Lab"
  }
}

module "common" {
  source = "./modules/common"

  location       = "eastus"
  rgroup_name    = "n01261681-assignment1-RG"
  storage_account = "n01261681storage"
  la_workspace   = {
    law_name   = "amandeep-law"
    log_sku    = "PerGB2018"
    retention  = 30
  }
  rs_vault       = {
    vault_name = "aman-recovery-vault"
    vault_sku  = "Standard"
  }
  rg_dependency = module.rgroup

  tags = {
    Project       = "Automation Project – Assignment 1"
    Name          = "amandeep.kaur"
    ExpirationDate = "2023-06-30"
    Environment   = "Lab"
  }
}

module "vmlinux" {
  source = "./modules/vmlinux"

  rgroup_name         = "n01261681-assignment1-RG"
  location            = "eastus"
  vm_name             = "amandeep-linux-vm1"
  vm_name2            = "amandeep-linux-vm2" 
  vm_size             = "Standard_DS2_v2"
  ssh_public_key      = "C:/Users/14377/.ssh/id_rsa.pub"
  ssh_private_key     = "C:/Users/14377/.ssh/id_rsa"
  subnet_id           = module.network.subnet1_id
  admin_username      = "amandeep"
  rg_dependency       = module.rgroup
  depends_on          = [module.rgroup]
  availability_set_id = module.vmlinux.availability_set_id

  tags = {
    Project       = "Automation Project – Assignment 1"
    Name          = "amandeep.kaur"
    ExpirationDate = "2023-06-30"
    Environment   = "Lab"
  }
}


resource "azurerm_virtual_machine_extension" "network_watcher_vm1" {
  name                 = "NetworkWatcherAgentLinux"
  virtual_machine_id   = module.vmlinux.vm_id
  publisher            = "Microsoft.Azure.NetworkWatcher"
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
}

resource "azurerm_virtual_machine_extension" "network_watcher_vm2" {
  name                 = "NetworkWatcherAgentLinux"
  virtual_machine_id   = module.vmlinux.vm2_id
  publisher            = "Microsoft.Azure.NetworkWatcher"
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
}

module "vmwindows" {
  source              = "./modules/vmwindows"
  resource_group      = "n01261681-assignment1-RG"
  location            = "eastus"
  depends_on          = [module.network]
  windows_name        = "amandeep-win"
  subnet_id           = module.network.subnet1_id
  boot_diagnostics_storage_account     = "n01261681storage"

}

module "datadisk" {
  source          = "./modules/datadisk"
  location        = "eastus"
  resource_group  = "n01261681-assignment1-RG"
  linux_vm_ids    = [module.vmlinux.vm_id, module.vmlinux.vm2_id]
  windows_vm_id   = module.vmwindows.Windows_vm.id
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  resource_group_name = "n01261681-assignment1-RG"
  location            = "eastus"
  linux_vm1_nic_id    = module.vmlinux.vm1_nic_id
  linux_vm2_nic_id    = module.vmlinux.vm2_nic_id
  tags = {
    Project       = "Automation Project – Assignment 1"
    Name          = "amandeep.kaur"
    ExpirationDate = "2023-06-30"
    Environment   = "Lab"
  }
}

module "database" {
  source = "./modules/database"

  location            = "eastus"
  resource_group_name = "n01261681-assignment1-RG"
  db_name             = "n01261681-postgres-server"
  db_admin_username   = "adminuser"
  db_admin_password   = "P@ssw0rd1234!"

  tags = {
    Project       = "Automation Project – Assignment 1"
    Name          = "amandeep.kaur"
    ExpirationDate = "2023-06-30"
    Environment   = "Lab"
  }
}
