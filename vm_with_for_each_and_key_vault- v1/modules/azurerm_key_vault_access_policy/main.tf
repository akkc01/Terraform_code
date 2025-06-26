resource "azurerm_key_vault_access_policy" "kvap" {
    for_each = var.kvaps
  key_vault_id = data.azurerm_key_vault.kv2[each.key].id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Backup",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set",
    ]
  }