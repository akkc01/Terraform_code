variable "nic" {
  description = "A map of network interfaces to create."
  type = map(object({
    nic_name                      = string
    rg_name                       = string
    location                      = string
    vnet_name                     = string
    subnet_name                   = string
    pip_name                      = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
    subnet_id                     = optional(string)
    public_ip_address_id          = optional(string)

  }))
}
