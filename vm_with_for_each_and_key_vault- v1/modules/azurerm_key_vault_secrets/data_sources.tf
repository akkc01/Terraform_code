data "azurerm_key_vault" "kv1" {
  for_each            = var.key_vaults_secrets
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

# output "vault_uri" {
#   value = data.azurerm_key_vault.example.vault_uri
# }
