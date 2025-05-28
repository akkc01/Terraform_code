resource "azurerm_storage_account" "sa_name" {
  name                     = var.sa_name
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
   
  tags = {
    environment = var.tags["environment"]
    owner       = var.tags["owner"]
    }
}