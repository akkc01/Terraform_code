# data "azurerm_key_vault_secret" "example" {
#   name         = "my-secret-name"
#   key_vault_id = azurerm_key_vault.example.id
# }

data "azurerm_key_vault" "kv" {
  name                = "akkcvault007"
  resource_group_name = var.rg_name
}