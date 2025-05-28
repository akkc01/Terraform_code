variable "sa" {
  description = "A map of storage accounts to create."
  type = map(object({
    sa_name                  = string
    rg_name                  = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

