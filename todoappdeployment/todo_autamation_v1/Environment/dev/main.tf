module "rg" {
  source         = "../../Module/azurerm_resource_group"
  resource_group = var.resource_group
}

module "vnet" {
  source     = "../../Module/azurerm_virtual_network"
  depends_on = [module.rg]
  vnet       = var.vnet
}

module "subnet" {
  source     = "../../Module/azurerm_subnet"
  depends_on = [module.vnet]
  subnet     = var.subnet
}

module "pip" {
  source     = "../../Module/azurerm_public_ip"
  depends_on = [module.rg]
  pips        = var.pips
}





# module "nic" {
#   source                        = "../../Module/azurerm_network_interface"
#   depends_on                    = [module.pip, module.subnet]
#   rg_name                       = "varddha-rg001"
#   location                      = "centralindia"
#   fvm_nic_name                  = "fvm-nic001"
#   bvm_nic_name                  = "bvm-nic001"
#   fvm_ip_configuration_name     = "fvm-ipconfig001"
#   bvm_ip_configuration_name     = "bvm-ipconfig001"
#   private_ip_address_allocation = "Dynamic"
#   fvm_subnet_id                 = module.subnet.fsub_id
#   bvm_subnet_id                 = module.subnet.bsub_id
#   fvm_public_ip_address_id      = module.pip.fvm_pip_id
#   bvm_public_ip_address_id      = module.pip.bvm_pip_id
# }


# module "nic-association" {
#   source                    = "../../Module/azurerm_network_interface_security_group_association"
#   depends_on                = [module.nic, module.nsg]
#   fvm_network_interface_id  = module.nic.fvm_nic_id
#   bvm_network_interface_id  = module.nic.bvm_nic_id
#   network_security_group_id = module.nsg.nsg_id
# }



# module "fvm" {
#   source                = "../../Module/azurerm_LVM_frontend"
#   depends_on            = [module.nic, module.kv, module.kv_secret]
#   vm_name               = "varddha-vm001"
#   rg_name               = "varddha-rg001"
#   location              = "centralindia"
#   vm_size               = "Standard_B1ms"
#   # fvm_username          = "varddhaadmin"
#   # fvm_password          = "Varddha@1234"
#   network_interface_ids = [module.nic.fvm_nic_id]
# }

# module "bvm" {
#   source                = "../../Module/azurerm_LVM_Backend"
#   depends_on            = [module.nic, module.kv, module.kv_secret]
#   vm_name               = "dewa-vm001"
#   rg_name               = "varddha-rg001"
#   location              = "centralindia"
#   vm_size               = "Standard_B1ms"
#   # bvm_username          = "varddhaadmin"
#   # bvm_password          = "Varddha@1234"
#   network_interface_ids = [module.nic.bvm_nic_id]
# }

# # module "mssql_server" {
# #   source          = "../../Module/azurerm_mssql_server"
# #   depends_on      = [module.rg]
# #   rg_name         = "varddha-rg001"
# #   location        = "centralindia"
# #   sql_server_name = "varddha-sqlserver001"
# #   sql_username    = "varddhaadmin"
# #   sql_password    = "Varddha@1234"

# # }

# # module "mssql_db" {
# #   source         = "../../Module/azurerm_mssql_db"
# #   depends_on     = [module.mssql_server]
# #   sql_db_name1   = "todo_sqldb"
# #   sql_db_name2   = "todo_sqldb2"
# #   collation      = "SQL_Latin1_General_CP1_CI_AS"
# #   license_type   = "LicenseIncluded"
# #   sku_name       = "S0"
# #   enclave_type   = "VBS"
# #   mssql_serer_id = module.mssql_server.mssql_server_id
# # }

# # module "upload_folder" {
# #   source             = "../../Module/azurerm_LVM_backend_upload"
# #   depends_on         = [module.bvm]
# #   user_name          = "varddhaadmin"
# #   password           = "Varddha@1234"
# #   bvm_pip            = module.pip.bvm_pip
# #   source_folder      = "D:/Devops_Code/todoappdeployment/todo_autamation_v2/todoappbackend.tar.gz"
# #   destination_folder = "/home/varddhaadmin/todoappbackend.tar.gz"

# # }


# module "kv" {
#   source = "../../module/azurerm_kv"
#   depends_on = [module.rg]
#   rg_name  = "varddha-rg001"
#   location = "centralindia"
# }

# module "kv_secret" {
#   source = "../../module/azurerm_kvs"
#   depends_on = [module.kv]
#   rg_name = "varddha-rg001"
#   fvm_username = var.fvm_username
#   fvm_password = var.fvm_password
#   bvm_username = var.bvm_username
#   bvm_password = var.bvm_password
# }
