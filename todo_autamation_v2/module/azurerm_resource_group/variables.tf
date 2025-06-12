variable "rg_name" {
  description = "A map of child resource groups to create."
  type = string
}

variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
  
}