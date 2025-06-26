data "azurerm_client_config" "current" {
    
}

data "azurerm_key_vault" "kv2" {
  for_each            = var.kvaps
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}
