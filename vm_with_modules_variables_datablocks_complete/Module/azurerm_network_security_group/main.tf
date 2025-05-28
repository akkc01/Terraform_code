resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
  location            = each.value.location

  security_rule {
    name                       = each.value.name_security_rule1
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = each.value.destination_port_range1
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
   security_rule {
    name                       = each.value.name_security_rule2
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = each.value.destination_port_range2
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
