module "rg_module" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "str_module" {
  depends_on       = [module.rg_module]
  source           = "../../modules/azurerm_storage_accounts"
  storage_accounts = var.storage_accounts

}

module "vnet_module" {
  depends_on = [module.rg_module]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}

module "subnet_module" {
  depends_on = [module.rg_module, module.vnet_module]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}

module "pips_module" {
  depends_on = [module.rg_module]
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips

}

module "nsg_module" {
  depends_on = [module.rg_module, module.vnet_module]
  source     = "../../modules/azurerm_network_security_group"
  nsgs       = var.nsgs
}

module "nic_module" {
  depends_on = [module.rg_module, module.vnet_module, module.subnet_module, module.pips_module, module.nsg_module]
  source     = "../../modules/azurerm_network_interface_card"
  nics       = var.nics


}


module "nsg-nic-assoc" {
  depends_on    = [module.rg_module, module.vnet_module, module.nic_module, module.nsg_module]
  source        = "../../modules/azurerm_nsg_nic_association"
  nsg-nic-assoc = var.nsg-nic-assoc
}

module "kv" {
  depends_on = [ module.rg_module]
  source = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
  
}

module "kvp" {
  depends_on = [ module.rg_module, module.vnet_module, module.kv ]
  source = "../../modules/azurerm_key_vault_access_policy"
  kvaps = var.kvaps
  
}

module "kvs" {
  depends_on = [ module.rg_module, module.vnet_module, module.kv, module.kvp ]
  source = "../../modules/azurerm_key_vault_secrets"
  key_vaults_secrets = var.key_vaults_secrets
  
}



module "mssql_server" {
  depends_on = [ module.rg_module, module.kv, module.kvs, module.kvp ]
  source = "../../modules/azurerm_mssql_server"
  mssql = var.mssql
  
}

module "mssql_db" {
  depends_on = [ module.rg_module, module.kv, module.kvs, module.kvp, module.mssql_server ]
  source = "../../modules/azurerm_mssql_database"
  mssql_db = var.mssql_db
  
}

module "vms_module" {
  depends_on = [module.rg_module, module.vnet_module, module.nic_module, module.kv, module.kvs, module.kvp ]
  source     = "../../modules/azurerm_LVM"
  vms        = var.vms
  

}
