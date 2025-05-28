# data "azurerm_public_ip" "vm1_pip" {
#   name                = azurerm_public_ip.vm1-publicip.name
#   resource_group_name = azurerm_windows_virtual_machine.vnet1-vm.resource_group_name
# }


# Here output used to display the public IP address of the virtual machine.
output "public_ip1" {
  value = azurerm_public_ip.vm1-publicip.ip_address

}

# data "azurerm_public_ip" "vm2_pip" {
#   name                = azurerm_public_ip.vm2-publicip.name
#   resource_group_name = azurerm_windows_virtual_machine.vnet2-vm.resource_group_name
# }




# Here output used to display the public IP address of the virtual machine.
output "public_ip2" {
  value = azurerm_public_ip.vm2-publicip.ip_address

}