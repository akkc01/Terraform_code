resource "azurerm_public_ip" "fvm_pip" {
  name                = var.fvm_pip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = var.allocation_method
}
# Compare this snippet from module/azurerm_public_ip/main.tf:

resource "azurerm_public_ip" "bvm_pip" {
  name                = var.bvm_pip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = var.allocation_method
}
