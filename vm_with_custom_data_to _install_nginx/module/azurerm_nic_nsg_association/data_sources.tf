data "azurerm_network_interface" "nic2" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}

data "azurerm_network_security_group" "nsg2" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
}