variable "nics" {
  type = map(object({
    name                         = string
    location                     = string
    resource_group_name          = string
    subnet_id                    = string  # Subnet name reference
    vnet_name                    = string  # VNet name for subnet lookup
    public_ip_name               = string
    network_security_group_name = string
  }))
}
