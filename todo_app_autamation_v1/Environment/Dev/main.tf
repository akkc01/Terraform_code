module "rg" {
  source   = "../../Module/azurerm_resource_group"
  rg_name  = "varddha-rg001"
  location = "centralindia"
}

module "vnet" {
  source        = "../../Module/azurerm_virtual_network"
  depends_on    = [module.rg]
  vnet_name     = "varddha-vnet001"
  address_space = ["192.168.4.0/24"]
  rg_name       = "varddha-rg001"
  location      = "centralindia"

}

module "subnet" {
  source            = "../../Module/azurerm_subnet"
  depends_on        = [module.vnet]
  fsub_name         = "Khanshaar-Frontend"
  rg_name           = "varddha-rg001"
  address_prefixes  = ["192.168.4.0/25"]
  vnet_name         = "varddha-vnet001"
  bsub_name         = "Khanshaar-Backend"
  address_prefixes1 = ["192.168.4.128/25"]
}

module "pip" {
  source            = "../../Module/azurerm_public_ip"
  depends_on        = [module.rg]
  fvm_pip_name      = "varddha-pip001"
  bvm_pip_name      = "varddha-pip002"
  rg_name           = "varddha-rg001"
  location          = "centralindia"
  allocation_method = "Static"
}

module "nic" {
  source                        = "../../Module/azurerm_network_interface"
  depends_on                    = [module.pip, module.subnet]
  rg_name                       = "varddha-rg001"
  location                      = "centralindia"
  fvm_nic_name                  = "fvm-nic001"
  bvm_nic_name                  = "bvm-nic001"
  fvm_ip_configuration_name     = "fvm-ipconfig001"
  bvm_ip_configuration_name     = "bvm-ipconfig001"
  private_ip_address_allocation = "Dynamic"
  fvm_subnet_id                 = module.subnet.fsub_id
  bvm_subnet_id                 = module.subnet.bsub_id
  fvm_public_ip_address_id      = module.pip.fvm_pip_id
  bvm_public_ip_address_id      = module.pip.bvm_pip_id
}

module "nsg" {
  source                  = "../../Module/azurerm_network_security_group"
  depends_on              = [module.rg]
  nsg_name                = "varddha-nsg001"
  rg_name                 = "varddha-rg001"
  location                = "centralindia"
  security_rule1          = "RDPAllow"
  security_rule2          = "SSHAllow"
  destination_port_range1 = "3389"
  destination_port_range2 = "22"



}

module "nic-association" {
  source                    = "../../Module/azurerm_network_interface_security_group_association"
  depends_on                = [module.nic, module.nsg]
  fvm_network_interface_id  = module.nic.fvm_nic_id
  bvm_network_interface_id  = module.nic.bvm_nic_id
  network_security_group_id = module.nsg.nsg_id
}

module "fvm" {
  source                = "../../Module/azurerm_LVM_frontend"
  depends_on            = [module.nic]
  vm_name               = "varddha-vm001"
  rg_name               = "varddha-rg001"
  location              = "centralindia"
  vm_size               = "Standard_B1s"
  admin_username        = "varddhaadmin"
  admin_password        = "Varddha@1234"
  network_interface_ids = [module.nic.fvm_nic_id]
}

module "bvm" {
  source                = "../../Module/azurerm_LVM_Backend"
  depends_on            = [module.nic]
  vm_name               = "dewa-vm001"
  rg_name               = "varddha-rg001"
  location              = "centralindia"
  vm_size               = "Standard_B1s"
  admin_username        = "varddhaadmin"
  admin_password        = "Varddha@1234"
  network_interface_ids = [module.nic.bvm_nic_id]
}