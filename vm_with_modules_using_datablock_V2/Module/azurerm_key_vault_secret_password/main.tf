variable "kvsp" {}
resource "azurerm_key_vault_secret" "password" {
  for_each = var.kvsp
  name         = each.value.pswdname
  value        = each.value.pas_value
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}