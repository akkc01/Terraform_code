output "public_ip_addresses" {
  value = {
    for k, pip in azurerm_public_ip.publicip :
    k => pip.ip_address
  }
}