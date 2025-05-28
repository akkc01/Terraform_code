variable "rg_name" {}
variable "location" {}
variable "pip_name" {}

resource "azurerm_public_ip" "this" {
  name                = var.pip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

output "pip_id" {
  value = azurerm_public_ip.this.id
}
