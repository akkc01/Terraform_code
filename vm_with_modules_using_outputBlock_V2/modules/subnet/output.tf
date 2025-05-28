output "subnet_ids_map" {
  value = {
    for key, subnet in azurerm_subnet.subnet :
    key => subnet.id
  }
}
