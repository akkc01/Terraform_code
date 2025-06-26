variable "resource_group_name" {
  description = "The name of the resource group in which to create the Linux Virtual Machine."
  type        = string  
  
}
variable "location" {
  description = "The Azure Region where the Linux Virtual Machine should exist."
  type        = string
}

variable "pip_name" {
  description = "The name of the Public IP address to associate with the Network Interface Card."
  type        = string
  
}