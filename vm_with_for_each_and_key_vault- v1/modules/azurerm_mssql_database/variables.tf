variable "mssql_db" {
  description = "database details"
  type = map(object({
    mssql_name   = string
    resource_group_name = string
    db_name      = string
    collation    = string
    license_type = string
    max_size_gb  = string
    sku_name     = string
    enclave_type = string
  }))
}
