variable "resource_group_name" {
  description = "The name of the resource group in which to create the Linux Virtual Machine."
  type        = string  
  
}
variable "location" {
  description = "The Azure Region where the Linux Virtual Machine should exist."
  type        = string
}
variable "subnet_name" {
  description = "The name of the subnet in which to create the Network Interface Card."
  type        = string      
  
}

variable "virtual_network_name" {
  description = "The name of the Virtual Network in which the subnet exists."
  type        = string                  
    
}

variable "public_ip_name" {
  description = "The name of the Public IP address to associate with the Network Interface Card."
  type        = string
  
}
variable "nic_name" {
  description = "The name of the Network Interface Card."
  type        = string
  
}