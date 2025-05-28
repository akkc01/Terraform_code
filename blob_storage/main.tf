resource "azurerm_resource_group" "rg" {
  name     = "my-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "str" {
  name                     = "examplestorageacc321"
  resource_group_name      = "my-rg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [azurerm_resource_group.rg]
}

resource "azurerm_storage_container" "my_container" {
  name                  = "my-awesome-image"
  storage_account_id    = azurerm_storage_account.str.id
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.str]
}

resource "azurerm_storage_blob" "my_blob" {
  name                   = "my-awesome-image.jpg"
  storage_account_name   = "examplestorageacc321"
  storage_container_name = "my-awesome-image"
  type                   = "Block"
  source                 = "C:/Users/AKKC/Pictures/kkc/my-awesome-image.jpg"
  depends_on             = [azurerm_storage_container.my_container]
}