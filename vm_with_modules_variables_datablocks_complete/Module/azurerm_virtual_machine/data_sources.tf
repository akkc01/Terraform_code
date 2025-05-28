
# data "azurerm_key_vault" "kv" {
#   for_each = var.vm
#     name                = each.value.name_kv
#     resource_group_name = each.value.name_rg
# }
# data "azurerm_key_vault_secret" "username" {
#   for_each = var.vm
#   name         = each.value.name_username
#   key_vault_id = data.azurerm_key_vault.kv[each.key].id
# }
# data "azurerm_key_vault_secret" "password" {
#   for_each = var.vm
#   name         = each.value.name_password
#   key_vault_id = data.azurerm_key_vault.kv[each.key].id
# }

data "azurerm_network_interface" "nic" {
  for_each = var.vm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name 
}
