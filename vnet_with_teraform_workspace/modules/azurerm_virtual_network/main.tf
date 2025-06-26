resource "azurerm_virtual_network" "this" {
  for_each = var.vnets

  name                = "${each.key}-vnet-${var.env}"
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}
