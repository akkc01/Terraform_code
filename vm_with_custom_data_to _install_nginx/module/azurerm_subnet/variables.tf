variable "resource_group_name" {
  description = "The name of the resource group in which to create the Linux Virtual Machine."
  type        = string  
  
}
variable "subnet_name" {
  description = "The Azure Region where the Linux Virtual Machine should exist."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network in which to create the subnet."
  type        = string
  
}