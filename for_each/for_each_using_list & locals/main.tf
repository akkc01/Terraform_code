# This file is used to create the resource group for the production environment
locals {
  rg_map = {
    for idx, rg in var.my_rg : idx => rg
  }
}

resource "azurerm_resource_group" "rg_prod" {
  for_each = local.rg_map

  name     = each.value.name
  location = each.value.location

  tags = {
    environment = "production"
  }
}
