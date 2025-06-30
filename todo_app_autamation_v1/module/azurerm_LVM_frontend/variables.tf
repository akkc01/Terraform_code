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


# variable "os_disk_caching" {
#   description = "The caching type for the OS disk."
#   type        = string    
  
# }

# variable "os_disk_storage_account_type" {
#   description = "The storage account type for the OS disk."
#   type        = string      
  
# }
# variable "publisher" {
#   description = "The publisher of the source image for the Virtual Machine."
#   type        = string    
  
# }
# variable "offer" {
#   description = "The offer of the source image for the Virtual Machine."
#   type        = string    
  
# }

# variable "sku" {
#   description = "The SKU of the source image for the Virtual Machine."
#   type        = string      
  
# }

# variable "version" {
#   description = "The version of the source image for the Virtual Machine."
#   type        = string
#   default     = "latest"
# }
