# Storage account
resource "azurerm_storage_account" "storage_account" {
  name                = var.storage_account
  resource_group_name = var.rgroup_name
  location            = var.location
  account_tier        = "Standard"
  account_replication_type = "LRS"
  tags            = var.tags
  depends_on = [var.rg_dependency]
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.la_workspace["law_name"]
  resource_group_name = var.rgroup_name
  location            = var.location
  sku                 = var.la_workspace["log_sku"]
  retention_in_days   = var.la_workspace["retention"]
  tags                = var.tags
  depends_on = [var.rg_dependency]
}

# Recovery Services Vault
resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = var.rs_vault["vault_name"]
  location            = var.location
  resource_group_name = var.rgroup_name
  sku                 = var.rs_vault["vault_sku"]
  tags                = var.tags
  depends_on = [var.rg_dependency]

}
