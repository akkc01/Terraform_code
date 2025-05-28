variable "pip" {}
resource "azurerm_public_ip" "pip" {
  for_each = var.pip
  name                = each.value.name_pip
  resource_group_name = each.value.name_rg
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}