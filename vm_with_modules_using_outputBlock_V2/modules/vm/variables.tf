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


variable "nic_id" {
  description = "The NIC ID to associate with the VM."
  type        = string
  
}
