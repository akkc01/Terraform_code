
variable "fvm_username" {
  type      = string
  sensitive = true
}
variable "fvm_password" {
  type      = string
  sensitive = true
}
variable "bvm_username" {
  type      = string
  sensitive = true  
  
}
variable "bvm_password" {
  type      = string
  sensitive = true
}
# variable "sql_username" {
#   type      = string
#   sensitive = true
# }
# variable "sql_password" {
#   type      = string
#   sensitive = true
# }


variable "rg_name" {
  description = "The name of the resource group where the Key Vault is located."
  type        = string  
  
}