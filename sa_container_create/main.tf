resource "azurerm_resource_group" "statefile_rg" {
  name     = "statefile-rg"
  location = "centralindia"
}

resource "azurerm_storage_account" "statefile_sa" {
  name                     = "akstatefilestrageaccount"
  resource_group_name      = azurerm_resource_group.statefile_rg.name
  location                 = azurerm_resource_group.statefile_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "statefile_container" {
  name                  = "statefilecontainer"
  storage_account_id  = azurerm_storage_account.statefile_sa.id
  container_access_type = "container"
}