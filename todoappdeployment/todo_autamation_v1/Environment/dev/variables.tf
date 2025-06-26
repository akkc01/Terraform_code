variable "resource_group" {
  description = "values for the resource group"
  type = map(object({
    rg_name  = string
    location = string
    tags = map(object({
      # Tags for the resource group
      owner       = string
      cost_center = string
      environment = string

    }))
  }))
}

variable "vnet" {
  description = "values for the virtual network"
  type = map(object({
    vnet_name        = string
    address_space    = list(string)
    location         = string
    resource_group_name = string
  }))
}

variable "subnet" {
  description = "values for the subnet"
  type = map(object({
    subnet_name          = string
    address_prefix       = string
    resource_group_name  = string
    virtual_network_name = string
  }))
}

variable "pips"{
  description = "values for public ip"
  type = map(object({
    pip_name           = string
    rg_name            = string
    location           = string
    allocation_method  = string
  })) 
}

variable "nsgs" {
  type = map(object({
    nsg_name = string
    location = string
    rg_name  = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}


