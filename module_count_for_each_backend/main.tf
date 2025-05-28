resource "azurerm_resource_group" "rg" {

  count    = 2
  name     = "akresourcegroup-${count.index}" # Use count.index to create unique names
  location = "East US"
}


resource "azurerm_resource_group" "devops" {
  for_each = var.rg
  name     = each.value.name
  location = each.value.location
}
