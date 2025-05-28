variable "snet" {
    description = "A map of subnets to create."
    type = map(object({
        name_snet            = string
        name_vnet            = string
        name_rg              = string
        address_prefixes     = list(string)
        # service_endpoints    = optional(list(string), [])
        # delegation           = optional(object({
        # name = string
        # service_delegation_name = string
        # }), null)
        # enforce_private_link_endpoint_network_policies = optional(bool, false)
    }))
}