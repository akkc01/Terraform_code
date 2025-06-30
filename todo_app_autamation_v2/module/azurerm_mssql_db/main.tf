resource "azurerm_mssql_database" "sql_db1" {
  name         = var.sql_db_name1
  server_id    = var.mssql_serer_id
  collation    = var.collation
  license_type = var.license_type
  max_size_gb  = 2
  sku_name     = var.sku_name
  enclave_type = var.enclave_type

}

resource "azurerm_mssql_database" "sql_db2" {
  name         = var.sql_db_name2
  server_id    = var.mssql_serer_id
  collation    = var.collation
  license_type = var.license_type
  max_size_gb  = 2
  sku_name     = var.sku_name
  enclave_type = var.enclave_type

}

resource "azurerm_mssql_firewall_rule" "allow_azure" {
  name             = "AllowAzureServices"
  server_id        = var.mssql_serer_id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
