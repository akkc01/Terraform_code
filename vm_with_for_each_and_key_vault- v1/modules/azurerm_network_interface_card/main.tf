
data "azurerm_subnet" "subnet" {
  for_each             = var.nics
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "public_ip" {
  for_each = var.nics
  name     = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  
}


resource "azurerm_network_interface" "nic" {
  for_each            = var.nics
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.public_ip[each.key].id
  }

}


