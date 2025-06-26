
resource "azurerm_key_vault_secret" "fvm_username" {
  name         = "fvm-username"
  value        = var.fvm_username
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "fvm_password" {
  name         = "fvm-password"
  value        = var.fvm_password
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "bvm_username" {
  name         = "bvm-username"
  value        = var.fvm_username
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "bvm_password" {
  name         = "bvm-password"
  value        = var.fvm_password
  key_vault_id = data.azurerm_key_vault.kv.id
}
# resource "azurerm_key_vault_secret" "sql_username" {
#   name         = "sql-username"
#   value        = var.sql_username
#   key_vault_id = var.key_vault_id
# }
# resource "azurerm_key_vault_secret" "sql_password" {
#   name         = "sql-password"
#   value        = var.sql_password
#  key_vault_id = var.key_vault_id
# }

