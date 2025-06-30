resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  resource_group_name             = var.rg_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids           = var.network_interface_ids
  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts-gen2"
      version   = "latest"
  }
  custom_data = base64encode(<<EOF
#!/bin/bash
# Update system
sudo apt-get update -y
sudo apt-get install -y python3-pip unixodbc unixodbc-dev curl gnupg

# Add Microsoft ODBC driver repo and key
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list
# Install Microsoft ODBC driver
sudo apt-get update -y
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17

EOF
)

}
