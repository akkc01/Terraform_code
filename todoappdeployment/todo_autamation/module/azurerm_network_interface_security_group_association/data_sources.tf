data "azurerm_resource_group" "rg" {
  for_each = var.nsg-nic-association
  name     = each.value.rg_name
}

data "azurerm_network_interface" "nic" {
  for_each = var.nsg-nic-association
    name                = each.value.nic_name
    resource_group_name = data.azurerm_resource_group.rg[each.key].name
}
data "azurerm_network_security_group" "nsg" {
  for_each = var.nsg-nic-association
  name                = each.value.nsg_name
  resource_group_name = data.azurerm_resource_group.rg[each.key].name
}
