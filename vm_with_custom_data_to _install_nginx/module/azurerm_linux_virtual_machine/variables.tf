variable "resource_group_name" {
  description = "The name of the resource group in which to create the Linux Virtual Machine."
  type        = string  
  
}
variable "location" {
  description = "The Azure Region where the Linux Virtual Machine should exist."
  type        = string
}
variable "admin_username" {
  description = "The administrator username for the Linux Virtual Machine."
  type        = string
  
}
variable "admin_password" {
  description = "The administrator password for the Linux Virtual Machine."
  type        = string
  sensitive   = true
}

variable "nic_name" {
  description = "The name of the Network Interface Card (NIC) to be created for the Linux Virtual Machine."
  type        = string
  
}

variable "vm_name" {
  description = "The name of the Linux Virtual Machine."
  type        = string
  
}