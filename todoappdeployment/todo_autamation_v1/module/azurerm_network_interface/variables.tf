variable "nics" {
  description = "The name of the network interface."
  type = map(object({
    nic_name                      = string
    location                      = string
    rg_name                       = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
  }))

}

