variable "rg_name" {}
variable "location" {}
variable "vnet_name" {}
variable "address_space" {}

resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.rg_name
}

output "vnet_name" {
  value = azurerm_virtual_network.this.name
}
