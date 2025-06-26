resource "azurerm_mssql_server" "sql" {
  for_each                     = var.mssql
  name                         = each.value.ss_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.kvs2[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.kvs3[each.key].value
  minimum_tls_version          = each.value.minimum_tls_version
}
