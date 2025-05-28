variable "nics" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  
  }))
}

variable "pip_id" {
  type = string
}

variable "nsg_id" {
  type = string
 
}

variable "subnet_id" {
  type        = string
  description = "The default subnet ID to associate with NICs if not overridden in each NIC"
}


