resource "azurerm_mssql_database" "sql_db" {
  name         = var.sql_db_name
  server_id    = var.mssql_serer_id
  collation    = var.collation
  license_type = var.license_type
  max_size_gb  = 2
  sku_name     = var.sku_name
  enclave_type = var.enclave_type

}