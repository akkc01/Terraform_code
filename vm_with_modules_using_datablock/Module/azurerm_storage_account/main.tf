
resource "azurerm_storage_account" "stg" {
    name                     = "examplestorageaccta"
    resource_group_name      = "zenai-rg"
    location                 = "westus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
}