variable "subnets" {
  description = "A map of child subnets to create."
  type = map(object({
    subnet_name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefix       = list(string)
  }))
}
