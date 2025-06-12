resource "azurerm_network_interface_security_group_association" "fvm_nsg-nic-assoc" {
  network_interface_id      = var.fvm_network_interface_id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_network_interface_security_group_association" "bvm_nsg-nic-assoc" {
  network_interface_id      = var.bvm_network_interface_id
  network_security_group_id = var.network_security_group_id
}