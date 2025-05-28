variable "vnet" {
  description = "values for the virtual network"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
  }))
}