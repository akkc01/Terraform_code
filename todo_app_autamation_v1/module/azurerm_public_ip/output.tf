output "fvm_pip_id" {
  value = azurerm_public_ip.fvm_pip.id
}

output "fvm_pip_name" {
  value = azurerm_public_ip.fvm_pip.name
  
}

output "bvm_pip_id" {
  value = azurerm_public_ip.bvm_pip.id
}

output "bvm_pip_name" {
  value = azurerm_public_ip.bvm_pip.name
  
}

output "fvm_pip" {
  value = azurerm_public_ip.fvm_pip.ip_address
  
}


output "bvm_pip" {
  value = azurerm_public_ip.bvm_pip.ip_address
  
}

