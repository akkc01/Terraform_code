variable "subnet" {
  description = "A map of subnets to create."
  type = map(object({
    subnet_name      = string
    rg_name          = string
    vnet_name        = string
    address_prefixes = list(string)
    # service_endpoints    = optional(list(string), [])
    # delegation           = optional(object({
    # name = string
    # service_delegation_name = string
    # }), null)
    # enforce_private_link_endpoint_network_policies = optional(bool, false)
  }))
}
