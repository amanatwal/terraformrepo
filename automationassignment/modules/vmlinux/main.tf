resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.rgroup_name
  size                = var.vm_size
  availability_set_id = var.availability_set_id

  admin_username = "amandeep"
  admin_ssh_key {
    username   = "amandeep"
    public_key = file(var.ssh_public_key)
  }

  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
}


  tags = var.tags

  depends_on = [var.rg_dependency]
}

resource "azurerm_linux_virtual_machine" "vm2" {
  name                = "${var.vm_name}-2"
  location            = var.location
  resource_group_name = var.rgroup_name
  size                = var.vm_size
  availability_set_id = var.availability_set_id

  admin_username = "amandeep"
  admin_ssh_key {
    username   = "amandeep"
    public_key = file(var.ssh_public_key)
  }

  network_interface_ids = [azurerm_network_interface.nic2.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

  tags = var.tags

  depends_on = [var.rg_dependency]
}

resource "azurerm_public_ip" "public_ip2" {
  name                = "${var.vm_name}-2-public-ip"
  location            = var.location
  resource_group_name = var.rgroup_name
  allocation_method   = "Dynamic"

  tags = var.tags
}

resource "azurerm_network_interface" "nic2" {
  name                = "${var.vm_name}-2-nic"
  location            = var.location
  resource_group_name = var.rgroup_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip2.id
  }

  tags = var.tags
}


resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vm_name}-public-ip"
  location            = var.location
  resource_group_name = var.rgroup_name
  allocation_method   = "Dynamic"

  tags = var.tags
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.rgroup_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }

  tags = var.tags
}

resource "azurerm_availability_set" "avail_set" {
  name                = "${var.vm_name}-availability-set"
  location            = var.location
  resource_group_name = var.rgroup_name
  platform_fault_domain_count = 2
  platform_update_domain_count = 2

  tags = var.tags
}
