variable "vnet" {
  description = "values for the virtual network"
  type = map(object({
    vnet_name        = string
    address_space    = list(string)
    location         = string
    resource_group_name = string
  }))
}