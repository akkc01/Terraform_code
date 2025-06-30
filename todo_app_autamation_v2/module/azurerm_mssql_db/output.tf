
output "sql_db1_name" {
  value = azurerm_mssql_database.sql_db1.name
  description = "The name of the SQL Database."
}


output "sql_db2_name" {
  value = azurerm_mssql_database.sql_db2.name
  description = "The name of the SQL Database."
}

