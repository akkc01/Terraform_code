resource "azurerm_network_security_group" "nsg" {
  name                = "${var.resource_group_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}
