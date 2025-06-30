variable "rg_name" {
  description = "A map of child resource groups to create."
  type = string
}

variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
  
}

variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
  
}

variable "administrator_login" {
  description = "The administrator login for the SQL Server."
  type        = string
  
}

variable "administrator_login_password" {
  description = "The password for the SQL Server administrator login."
  type        = string
  sensitive   = true
  
}
