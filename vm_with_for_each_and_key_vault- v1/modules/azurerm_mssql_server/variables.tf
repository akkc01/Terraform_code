variable "mssql" {
  description = "mssql server data details"
  type = map(object({
    ss_name             = string
    resource_group_name = string
    location            = string
    version             = string
    minimum_tls_version = string
    kv_name             = string
    sql_username        = string
    sql_password        = string
  }))

}
