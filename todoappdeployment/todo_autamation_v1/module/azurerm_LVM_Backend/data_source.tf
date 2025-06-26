data "azurerm_key_vault" "kv1" {
  name                = "akkcvault007"
  resource_group_name = var.rg_name
}

data "azurerm_key_vault_secret" "bvm_username" {
  name         = "bvm-username"
  key_vault_id = data.azurerm_key_vault.kv1.id
}

data "azurerm_key_vault_secret" "bvm_password" {
  name         = "bvm-password"
   key_vault_id = data.azurerm_key_vault.kv1.id
}