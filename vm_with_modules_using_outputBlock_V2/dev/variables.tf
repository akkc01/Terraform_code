variable "rgs" {
  description = "A map of child resource groups to create."
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  description = "A map of child vnets to create."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)

  }))
}

variable "subnets" {
  description = "A map of child subnets to create."
  type = map(object({
    name                = string
    resource_group_name = string
    virtual_network_name = string
    address_prefixes     = list(string)
    
  }))
}

variable "pips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string

  }))
}

variable "nsgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

  }))
}

variable "nics" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  
  ip_configuration = object({
    name                          = string
    subnet_id                     = optional(list(string))
    private_ip_address_allocation = string
    public_ip_address_id          = optional(list(string))
  })
  }))
}

variable "vm" {
  description = "A map of child VMs to create."
  type = map(object({
    name                  = string
    resource_group_name   = string
    location              = string
    size                  = string
    admin_username        = string
    admin_password        = string
     network_interface_ids = optional(list(string))

    os_disk = object({
      name                 = string
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

  }))
}
