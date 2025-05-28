variable "kv" {}

resource "azurerm_key_vault" "kv" {
  for_each = var.kv
  name                = each.value.name_kv
  location            = each.value.location
  resource_group_name = each.value.name_rg
  sku_name            = each.value.sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id
    object_id          = data.azurerm_client_config.current.object_id
    key_permissions    = each.value.key_permissions
    secret_permissions = each.value.secret_permissions
}
}
