data "azurerm_key_vault" "kv3" {
  for_each            = var.vms
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "kvs4" {
    for_each = var.vms
  name         = each.value.user_secrets
  key_vault_id = data.azurerm_key_vault.kv3[each.key].id
}

data "azurerm_key_vault_secret" "kvs5" {
    for_each = var.vms
  name         = each.value.password_secrets
  key_vault_id = data.azurerm_key_vault.kv3[each.key].id
}

