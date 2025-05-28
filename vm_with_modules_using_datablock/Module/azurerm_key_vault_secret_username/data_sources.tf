
data "azurerm_key_vault" "kv" {
  for_each = var.kvsu
    name                = each.value.name_kv
    resource_group_name = each.value.name_rg
}