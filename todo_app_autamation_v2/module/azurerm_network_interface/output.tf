output "fvm_nic_id" {
  value = azurerm_network_interface.fvm_nic.id
}
output "fvm_nic_name" {
  value = azurerm_network_interface.fvm_nic.name
  
}

output "bvm_nic_id" {
  value = azurerm_network_interface.bvm_nic.id
}
output "bvm_nic_name" {
  value = azurerm_network_interface.bvm_nic.name
  
}