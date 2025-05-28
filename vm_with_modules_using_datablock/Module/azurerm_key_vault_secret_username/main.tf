variable "kvsu" {}
resource "azurerm_key_vault_secret" "username" {
  for_each = var.kvsu
  name         = each.value.username
  value        = each.value.user_value
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

