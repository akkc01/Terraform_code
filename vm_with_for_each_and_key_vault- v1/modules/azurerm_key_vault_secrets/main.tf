resource "azurerm_key_vault_secret" "kvs" {
  for_each     = var.key_vaults_secrets
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.kv1[each.key].id
}
