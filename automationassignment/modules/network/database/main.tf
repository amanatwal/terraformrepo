resource "azurerm_postgresql_server" "postgresql_server" {
  name                = var.db_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "GP_Gen5_2"

  storage_mb = 5120
  backup_retention_days = 7

  geo_redundant_backup_enabled = false
  auto_grow_enabled = true

  administrator_login          = var.db_admin_username
  administrator_login_password = var.db_admin_password

  version = "11"

  ssl_enforcement_enabled = true

  tags = var.tags
}

resource "azurerm_postgresql_database" "database" {
  name                = "${var.db_name}_db"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
