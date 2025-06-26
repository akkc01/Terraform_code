resource "azurerm_resource_group" "rg" {
  for_each = var.resource_group

  name     = each.value.rg_name
  location = each.value.location
  tags = {
    environment = each.value.tags.environment
    owner       = each.value.tags.owner
    cost_center = each.value.tags.cost_center
  }
}

