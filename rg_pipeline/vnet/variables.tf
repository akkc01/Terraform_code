variable "child_vnet" {
  description = "A map of child vnets to create."
  type        = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    
  }))
}
