variable "vm_name" {
  description = "The name of the Virtual Machine."
  type        = string  
  
}
variable "rg_name" {
  description = "The name of the resource group where the Virtual Machine will be created."
  type        = string    
  
}
variable "location" {
  description = "The Azure region where the Virtual Machine will be created."
  type        = string  
  
}

variable "vm_size" {
  description = "The size of the Virtual Machine."
  type        = string    
  
}

variable "admin_username" {
  description = "The administrator username for the Virtual Machine."
  type        = string      
  
}

variable "admin_password" {
  description = "The administrator password for the Virtual Machine."
  type        = string
  
}

variable "network_interface_ids" {
  description = "The IDs of the network interfaces to associate with the Virtual Machine."
  type        = list(string)    
}

