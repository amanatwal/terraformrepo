resource "azurerm_resource_group" "rgroup" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    Project         = var.project_tag
    Name            = var.name_tag
    ExpirationDate  = var.expiration_date_tag
    Environment     = var.environment_tag
  }
}
