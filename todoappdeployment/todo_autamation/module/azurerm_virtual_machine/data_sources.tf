data "azurerm_network_interface" "nic" {
  for_each = var.vm
  name                = each.value.name_nic
  resource_group_name = each.value.name_rg  
}
