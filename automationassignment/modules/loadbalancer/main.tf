resource "azurerm_public_ip" "lb_public_ip" {
  name                = "loadbalancer-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
  tags                = var.tags
}

resource "azurerm_lb" "basic_lb" {
  name                = "basic-loadbalancer"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "public-ip"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.basic_lb.id
  name            = "backend-address-pool"
}

resource "azurerm_lb_probe" "probe" {
  name               = "tcp_probe"
  loadbalancer_id    = azurerm_lb.basic_lb.id
  protocol           = "Tcp"
  port               = 80
  interval_in_seconds = 15
  number_of_probes    = 4
}


resource "azurerm_lb_rule" "rule" {
  loadbalancer_id                = azurerm_lb.basic_lb.id
  name                           = "http-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "public-ip"
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.probe.id
}

resource "azurerm_network_interface_backend_address_pool_association" "linux_vm1_association" {
  network_interface_id    = var.linux_vm1_nic_id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "linux_vm2_association" {
  network_interface_id    = var.linux_vm2_nic_id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}
