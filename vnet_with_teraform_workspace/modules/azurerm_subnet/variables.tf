variable "subnets" {
  type = map(object({
    name                = string
    address_prefix      = string
    resource_group_name = string
    vnet_name           = string
  }))
}
