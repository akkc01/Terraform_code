module "rg" {
  source = "../../Module/azurerm_resource_group"
  rg     = var.rg
}
module "vnet" {
  source     = "../../Module/azurerm_virtual_network"
  depends_on = [module.rg]
  vnet       = var.vnet

}
module "snet" {
  source     = "../../Module/azurerm_subnet"
  depends_on = [module.vnet]
  snet       = var.snet

}
module "pip" {
  source     = "../../Module/azurerm_public_ip"
  depends_on = [module.rg]
  pip        = var.pip
}
module "nic" {
  source        = "../../Module/azurerm_network_interface"
  depends_on    = [module.pip, module.snet]
  nic           = var.nic
}
module "kv" {
  source     = "../../Module/azurerm_key_vault"
  depends_on = [module.rg, module.pip]
  kv         = var.kv
}
module "vm" {
  source     = "../../Module/azurerm_virtual_machine"
  depends_on = [module.nic, module.kv]
  vm         = var.vm
}

module "nsg" {
  source     = "../../Module/azurerm_network_security_group"
  depends_on = [module.vm]
  nsg        = var.nsg
}
module "nic-assoc" {
  source        = "../../Module/azurerm_network_interface_security_group_association"
  depends_on    = [module.nic, module.nsg, module.vm]
  nsg-nic-assoc = var.nsg-nic-assoc

}
module "kvsu" {
  source     = "../../Module/azurerm_key_vault_secret_username"
  depends_on = [module.kv]
  kvsu       = var.kvsu
}
module "kvsp" {
  source     = "../../Module/azurerm_key_vault_secret_password"
  depends_on = [module.kv]
  kvsp       = var.kvsp
}