output "fsub_id" {
  value = azurerm_subnet.frontend_subnet.id
}

output "bsub_id" {
  value = azurerm_subnet.backend_subnet.id
}




output "fsub_name" {
  value = azurerm_subnet.frontend_subnet.name
}

output "bsub_name" {
  value = azurerm_subnet.backend_subnet.name
}