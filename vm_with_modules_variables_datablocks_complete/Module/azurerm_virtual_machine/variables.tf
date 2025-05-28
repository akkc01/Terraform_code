variable "vm" {
  description = "A map of virtual machines to create."
  type = map(object({
    vm_name        = string
    rg_name        = string
    location       = string
    vm_size        = string
    admin_username = string
    admin_password = string
    nic_name       = string
  }))
}
