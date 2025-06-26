resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsgs
  name                = each.value.name_nsg
  location            = each.value.location
  resource_group_name = each.value.name_rg

  security_rule {
    name                       = each.value.name_security_rule
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = each.value.source_port_range
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix



  }
}
