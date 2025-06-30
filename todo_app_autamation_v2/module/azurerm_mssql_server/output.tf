output "mssql_server_id" {
  description = "The ID of the MSSQL Server."
  value       = azurerm_mssql_server.mssql_server.id
  
}

output "sql_server_name" {
  value = azurerm_mssql_server.mssql_server.name
  description = "The name of the SQL Server."
}