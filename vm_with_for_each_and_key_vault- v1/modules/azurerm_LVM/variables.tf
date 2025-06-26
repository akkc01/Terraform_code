variable "vms" {
  type = map(object({
    vm_name             = string
    resource_group_name = string
    location            = string
    size                = string
    nic_name            = string
    kv_name             = string
    user_secrets        = string
    password_secrets    = string


    os_disk = object({
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

