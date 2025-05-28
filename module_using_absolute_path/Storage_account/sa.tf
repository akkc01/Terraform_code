resource "azurerm_storage_account" "sa" {
  name                     = "akkcstorageacc"
  location                 = "centralindia"
  resource_group_name      = "akkc_rg"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}
