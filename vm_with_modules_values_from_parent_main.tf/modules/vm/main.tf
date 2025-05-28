variable "rg_name" {}
variable "location" {}
variable "nic_id" {}
variable "vm_name" {}
variable "admin_user" {}
variable "admin_password" {}

resource "azurerm_windows_virtual_machine" "this" {
  name                  = var.vm_name
  resource_group_name   = var.rg_name
  location              = var.location
  size                  = "Standard_B2s"
  admin_username        = var.admin_user
  admin_password        = var.admin_password
  network_interface_ids = [var.nic_id]

  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  computer_name = var.vm_name
}
