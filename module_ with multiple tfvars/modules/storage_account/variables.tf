variable "sa_name" {
  # description = "The name of the storage account"
  # type        = string
  # default     = "devlopers1storageaccount"  
  
}
variable "location" {
  # description = "The location of the storage account"
  # type        = string
  # default     = "East US"
  
}
variable "resource_group" {
  # description = "The name of the resource group"
  # type        = string
  # default     = "Module_rg"
  
}
variable "account_tier" {
  # description = "The replication type of the storage account"
  # type        = string
  # default     = "Standard"
  
}

variable "account_replication_type" {
  # description = "The replication type of the storage account"
  # type        = string
  # default     = "LRS"
  
}
variable "tags" {
  # description = "A map of tags to assign to the resource group"
  # type        = map(string)
  # default     = {
  #   environment = "dev"
  #   owner       = "akkc"
  # }
  
}