variable "fvm_network_interface_id" {
  description = "The ID of the network interface to associate with the security group."
  type        = string    
  
}

variable "bvm_network_interface_id" {
  description = "The ID of the network interface to associate with the security group."
  type        = string    
  
}

variable "network_security_group_id" {
  description = "The ID of the network security group to associate with the network interface."
  type        = string          
  
}
