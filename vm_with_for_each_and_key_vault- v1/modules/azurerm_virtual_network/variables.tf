variable "vnets" {
  description = "A map of child vnets to create."
  type        = map(object({
    vnet_name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    
  }))
}
