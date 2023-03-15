output "postgresql_server_name" {
  description = "The name of the PostgreSQL Server"
  value       = azurerm_postgresql_server.postgresql_server.name
}
