resource "azurerm_network_interface" "fvm_nic" {
  name                = var.fvm_nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.fvm_ip_configuration_name
    subnet_id                     = var.fvm_subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.fvm_public_ip_address_id
  }
}


resource "azurerm_network_interface" "bvm_nic" {
  name                = var.bvm_nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.bvm_ip_configuration_name
    subnet_id                     = var.bvm_subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.bvm_public_ip_address_id
  }
}


















