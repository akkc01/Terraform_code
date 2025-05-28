# This file is used to create the resource group for the production environment
resource "azurerm_resource_group" "rg_prod" {
  for_each = var.MY-RG

  name     = each.value.name
  location = each.value.location
}
