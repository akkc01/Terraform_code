resource "azurerm_resource_group" "module_rg" {
  name     = var.resource_group
  location = var.location
    tags = {
    environment = var.tags["environment"]
    owner       = var.tags["owner"]
    }
}