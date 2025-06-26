output "nsg_names" {
  value = {
    for key, nsg in azurerm_network_security_group.this :
    key => nsg.name
  }
}
