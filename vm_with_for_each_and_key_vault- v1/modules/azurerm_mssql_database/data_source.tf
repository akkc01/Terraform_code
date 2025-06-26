data "azurerm_mssql_server" "sql1" {
  for_each            = var.mssql_db
  name                = each.value.mssql_name
  resource_group_name = each.value.resource_group_name
}
