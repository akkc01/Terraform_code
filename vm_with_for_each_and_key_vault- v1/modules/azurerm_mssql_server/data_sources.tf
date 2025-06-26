data "azurerm_key_vault" "kv2" {
  for_each            = var.mssql
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "kvs2" {
    for_each = var.mssql
  name         = each.value.sql_username
  key_vault_id = data.azurerm_key_vault.kv2[each.key].id
}

data "azurerm_key_vault_secret" "kvs3" {
    for_each = var.mssql
  name         = each.value.sql_password
  key_vault_id = data.azurerm_key_vault.kv2[each.key].id
}