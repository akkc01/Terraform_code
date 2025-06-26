variable "nics" {
  type = map(object({
    nic_name                = string
    location            = string
    resource_group_name = string
    subnet_name          = string
    virtual_network_name = string
    pip_name             = string

    ip_configuration = object({
      name                          = string
      #subnet_id                     = string
      private_ip_address_allocation = string
      #public_ip_address_id          = string
    })

  }))
}
