variable "snet" {}
resource "azurerm_subnet" "frontend_subnet" {
  for_each             = var.snet
  name                 = each.value.name_snet
  virtual_network_name = each.value.name_vnet
  resource_group_name  = each.value.name_rg
  address_prefixes     = each.value.address_prefixes
}
