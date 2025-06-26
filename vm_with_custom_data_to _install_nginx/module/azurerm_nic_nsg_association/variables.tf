variable "resource_group_name" {
  description = "The name of the resource group in which to create the Linux Virtual Machine."
  type        = string
  
}

variable "nic_name" {
  description = "The name of the Network Interface Card (NIC) to associate with the Network Security Group."
  type        = string
  
}

variable "nsg_name" {
  description = "The name of the Network Security Group to associate with the Network Interface Card."
  type        = string
  
}