resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = data.azurerm_network_interface.nic2.id
  network_security_group_id = data.azurerm_network_security_group.nsg2.id
}