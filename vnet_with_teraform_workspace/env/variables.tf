variable "environment_config" {
  type = map(object({
    resource_groups = map(object({
      name     = string
      location = string
    }))
    vnets = map(object({
      address_space       = list(string)
      location            = string
      resource_group_name = string
    }))
    subnets = map(object({
      name                = string
      address_prefix      = string
      resource_group_name = string
      vnet_name           = string
    }))
    public_ips = optional(map(object({
      name                = string
      location            = string
      resource_group_name = string
      allocation_method   = string
      sku                 = string
    })), {})
  }))
}
