resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
    tags     = {
        environment = var.tags["environment"]
        project     = var.tags["project"]
                
    }
}


resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name1
  location = var.location1
    tags     = {
        environment = var.tags1["environment"]
        project     = var.tags1["project"]
                
    }
}