
variable "nsg-nic-assoc" {}
resource "azurerm_network_interface_security_group_association" "nsg-nic-assoc" {
  for_each = var.nsg-nic-assoc
  network_interface_id      = data.azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}