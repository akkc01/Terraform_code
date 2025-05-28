output "pip_ids_map" {
  value = {
    for key, pip in azurerm_public_ip.public_ip :
    key => pip.id
  }
}
