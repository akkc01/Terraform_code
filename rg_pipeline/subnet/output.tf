# output "subnet_id" {
#   value = azurerm_subnet.subnet1.id
# }
# # output "subnet_map" {
# #   value = {
# #     for k, v in azurerm_subnet.subnet1 : k => {
# #       id = v.id
# #     }
# #   }
# # }

output "subnet_id_map" {
  description = "Map of subnet names to their IDs"
  value = {
    for key, subnet in azurerm_subnet.subnet :
    key => subnet.id
  }
}
