variable "storage_accounts" {
  description = "A map of child storage accounts to create."
  type        = map(object({
    sa_name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
#   default     = {
#     "str1" = {
#       name                     = "storageaccountname1"
#       resource_group_name      = "rg1"
#       location                 = "East US"
#       account_tier             = "Standard"
#       account_replication_type = "GRS"
#     }
#     "str2" = {
#       name                     = "storageaccountname2"
#       resource_group_name      = "rg2"
#       location                 = "West US"
#       account_tier             = "Standard"
#       account_replication_type = "LRS"
#     }
#   }
  
}