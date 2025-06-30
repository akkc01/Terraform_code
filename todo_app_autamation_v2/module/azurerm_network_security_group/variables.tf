variable "nsg_name" {
  description = "The name of the Network Security Group."
  type        = string
  
}

variable "rg_name" {
  description = "The name of the resource group where the Network Security Group will be created."
  type        = string    
  
}

variable "location" {
  description = "The Azure region where the Network Security Group will be created."
  type        = string  
  
}
variable "security_rule1" {
  description = "security rule 1 for the Network Security Group."
  type = string
}

variable "security_rule2" {
  description = "security rule 2 for the Network Security Group."
  type = string 
  
}

variable "destination_port_range1" {
  description = "The destination port range for security rule 1."
  type        = string    
  
}

variable "destination_port_range2" {
  description = "The destination port range for security rule 2."
  type        = string  
  
}

variable "destination_port_range3" {
  description = "The destination port range for security rule 2."
  type        = string  
  
}
variable "destination_port_range4" {
  description = "The destination port range for security rule 2."
  type        = string  
  
}