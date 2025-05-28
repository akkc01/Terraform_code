variable "nsg" {}
resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsg
  name                = each.value.name_nsg
  location            = each.value.location
  resource_group_name = each.value.name_rg

  security_rule {
    name                       = each.value.name_security_rule
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}