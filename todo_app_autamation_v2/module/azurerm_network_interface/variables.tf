variable "fvm_nic_name" {
  description = "The name of the network interface."
  type        = string  
  
}

variable "bvm_nic_name" {
  description = "The name of the network interface."
  type        = string  
  
}

variable "rg_name" {
  description = "The name of the resource group where the network interface will be created."
  type        = string
  
}
variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
  
}

variable "fvm_ip_configuration_name" {
  description = "The name of the IP configuration for the network interface."
  type        = string

  
}

variable "bvm_ip_configuration_name" {
  description = "The name of the IP configuration for the network interface."
  type        = string
  
}

variable "private_ip_address_allocation" {
  description = "The private IP address allocation method for the network interface."
  type        = string
  default     = "Dynamic"

  validation {
    condition     = contains(["Dynamic", "Static"], var.private_ip_address_allocation)
    error_message = "Allowed values are 'Dynamic' or 'Static'."
  }
}


variable "fvm_subnet_id" {
  description = "The ID of the subnet to which the network interface will be connected."
  type        = string
  
}

variable "bvm_subnet_id" {
  description = "The ID of the subnet to which the network interface will be connected."
  type        = string
  
}

variable "fvm_public_ip_address_id" {
  description = "The ID of the public IP address associated with the network interface. Set to null if not needed."
  type        = string
  default     = null
}

variable "bvm_public_ip_address_id" {
  description = "The ID of the public IP address associated with the network interface. Set to null if not needed."
  type        = string
  default     = null
}