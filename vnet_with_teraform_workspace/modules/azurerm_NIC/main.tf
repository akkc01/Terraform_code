
resource "azurerm_network_interface" "this" {
  for_each = var.nics

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.target[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }

 # network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
# network_security_group_id = data.azurerm_network_security_group.nsg[each.value.network_security_group_name].id

}
