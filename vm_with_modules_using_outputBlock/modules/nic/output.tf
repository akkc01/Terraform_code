output "nic_ids_map" {
  value = {
    for key, nic in azurerm_network_interface.nic :
    key => nic.id
  }
}
