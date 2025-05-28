variable "rg_name" {}
variable "location" {}
variable "nic_name" {}
variable "subnet_id" {}
variable "pip_id" {}
variable "nsg_id" {}

resource "azurerm_network_interface" "this" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.pip_id
  }


}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = var.nsg_id
}



output "nic_id" {
  value = azurerm_network_interface.this.id
}
