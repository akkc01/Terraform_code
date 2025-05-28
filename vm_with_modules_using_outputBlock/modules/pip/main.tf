resource "azurerm_public_ip" "public_ip" {
  for_each            = var.pips
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}


