variable "sql_db_name1" {
  description = "The name of the SQL Database."
  type        = string
  
}

variable "sql_db_name2" {
  description = "The name of the SQL Database."
  type        = string
  
}


variable "mssql_serer_id" {
  description = "The name of the MSSQL Server."
  type        = string  
  
}

variable "collation" {
  description = "The collation of the SQL Database."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "license_type" {
  description = "The license type for the SQL Database."
  type        = string
  default     = "LicenseIncluded"
}

variable "max_size_gb" {
  description = "The maximum size of the SQL Database in GB."
  type        = number
  default     = 2
}

variable "sku_name" {
  description = "The SKU name for the SQL Database."
  type        = string
  default     = "S0"
}

variable "enclave_type" {
  description = "The enclave type for the SQL Database."
  type        = string
  default     = "VBS"
}
