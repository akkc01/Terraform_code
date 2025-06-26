data "azurerm_key_vault" "kv2" {
  name                = "akkcvault007"
  resource_group_name = var.rg_name
}

data "azurerm_key_vault_secret" "fvm_username" {
  name         = "bvm-username"
  key_vault_id = data.azurerm_key_vault.kv2.id
}

data "azurerm_key_vault_secret" "fvm_password" {
  name         = "bvm-password"
  key_vault_id = data.azurerm_key_vault.kv2.id
}