resource "azurerm_public_ip" "public_ip" {
  name                = "${var.resource_group_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

output "public_ip_id" {
  value = azurerm_public_ip.public_ip.id
}

output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}
