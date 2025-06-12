variable "fvm_pip_name"{
  description = "value"
}

variable "bvm_pip_name"{
  description = "value"
}

variable "rg_name" {
  description = "A map of child resource groups to create."
  type = string
}

variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
  
}

variable "allocation_method" {
  description = "The allocation method for the public IP address."
  type        = string
  default     = "Static"
  
}

