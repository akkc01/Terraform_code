output "nsg_ids_map" {
  value = {
    for key, nsg in azurerm_network_security_group.nsg :
    key => nsg.id
  }
}