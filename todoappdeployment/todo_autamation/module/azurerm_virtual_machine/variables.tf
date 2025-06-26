variable "vm" {
  description = "A map of virtual machines to create."
  type = map(object({
    vm_name                         = string
    rg_name                         = string
    location                        = string
    vm_size                         = string
    admin_username                  = string
    admin_password                  = string
    network_interface_ids           = list(string)
    os_disk = object({
      os_disk_caching              = string
      os_disk_storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
