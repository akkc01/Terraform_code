output "public_ip_addresses" {
  value = {
    for k, pip in azurerm_public_ip.this :
    k => pip.ip_address
  }
}
