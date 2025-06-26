resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = each.value.name
  address_prefixes     = [each.value.address_prefix]
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
}
