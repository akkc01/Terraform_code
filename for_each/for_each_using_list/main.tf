# This file is used to create the resource group for the production environment

resource "azurerm_resource_group" "rg_prod" {
  for_each = toset(var.my_rg)
  name     = each.value
  location = "eastus"
}
