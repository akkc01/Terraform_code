resource "azurerm_subnet" "frontend_subnet" {
  name                 = var.fsub_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes

}


resource "azurerm_subnet" "backend_subnet" {
  name                 = var.bsub_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes1

}