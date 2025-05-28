data "azurerm_resource_group" "rg" {
  for_each = var.nic
  name     = each.value.rg_name
}

data "azurerm_virtual_network" "vnet" {
  for_each            = var.nic
  name                = each.value.vnet_name
  resource_group_name = data.azurerm_resource_group.rg[each.key].name
}

data "azurerm_subnet" "frontend_subnet" {
    for_each = var.nic
    name                 = each.value.subnet_name
    virtual_network_name = data.azurerm_virtual_network.vnet[each.key].name
    resource_group_name  = data.azurerm_resource_group.rg[each.key].name
}

data "azurerm_public_ip" "pip" {
    for_each = var.nic
    name                = each.value.pip_name
    resource_group_name = data.azurerm_resource_group.rg[each.key].name
}
