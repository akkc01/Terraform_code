variable "child_subnet" {
  description = "A map of child subnets to create."
  type = map(object({
    name                 = string
    resource_group_name  = string
    id                  = optional(string) 
    virtual_network_name = string
    address_prefix       = list(string)
    #service_endpoints    = list(string)
  }))
}
