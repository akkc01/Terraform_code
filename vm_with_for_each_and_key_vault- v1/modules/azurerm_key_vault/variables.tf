variable "key_vaults" {
  description = "A map of root key vaults to create."
  type = map(object({
    kv_name                     = string
    resource_group_name         = string
    location                    = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))

}
