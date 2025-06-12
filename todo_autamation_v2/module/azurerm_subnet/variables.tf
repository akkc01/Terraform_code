variable "fsub_name" {
  description = "The name of the subnet."
  type        = string
  
}

variable "bsub_name" {
  description = "The name of the subnet."
  type        = string
  
}


variable "rg_name" {
  description = "A map of child resource groups to create."
  type = string
  
}

variable "vnet_name" {
  description = "A map of child virtual networks to create."
  type = string
  
}

variable "address_prefixes" {
  description = "The address space for the virtual network."
  type        = list(string)  
  
}


variable "address_prefixes1" {
  description = "The address space for the virtual network."
  type        = list(string)  
  
}

