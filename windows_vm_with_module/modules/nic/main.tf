resource "azurerm_network_interface" "network_interface" {
  name                      = "${var.resource_group_name}-nic"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  network_security_group_id = var.nsg_id
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}

output "network_interface_id" {
  value = azurerm_network_interface.network_interface.id
}
