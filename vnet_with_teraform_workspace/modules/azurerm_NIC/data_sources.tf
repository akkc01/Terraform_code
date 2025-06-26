data "azurerm_subnet" "target" {
  for_each = var.nics

  name                 = each.value.subnet_id
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
  for_each = var.nics
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_network_security_group" "nsg" { 
#   for_each = var.nics
#   name                = each.value.network_security_group_name
#   resource_group_name = each.value.resource_group_name
# }
data "azurerm_network_security_group" "nsg" {
  for_each = {
    for k, nic in var.nics :
    nic.network_security_group_name => {
      name                = nic.network_security_group_name
      resource_group_name = nic.resource_group_name
    }
  }

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
