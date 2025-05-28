
resource "azurerm_storage_account" "sa" {
  for_each                 = var.sa
  name                     = each.value.sa_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

