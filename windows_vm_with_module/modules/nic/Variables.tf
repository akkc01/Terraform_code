variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}
variable "nsg_id" {
  description = "The name of the network security group"
  type        = string
  
}