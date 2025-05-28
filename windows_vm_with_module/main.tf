# module "resource_group" {
#   source = "E:\\DevOpsTerraform\\modules\\windows_vm_with_module\\modules\\Resource_group"
# }
module "rg" {
  source              = "../modules/resource_group"
  resource_group_name = var.resource_group_name

}

module "vnet" {
  depends_on = [ module.rg]
  source    = "../modules/vnet"
  vnet_name = var.vnet_name
}

module "subnet" {
  depends_on = [ module.vnet ]
  source = "../modules/subnet"
   vnet_name = var.vnet_name
  subnet_id = module.subnet.subnet_id
}

module "nsg" {
  source              = "./modules/nsg"
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_name             = var.vm_name
}

module "public_ip" {
  source              = "./modules/public_ip"
  vm_name             = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network_interface" {
  source              = "./modules/network_interface"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.subnet.subnet_id
  public_ip_id        = module.public_ip.public_ip_id
  nsg_id              = module.nsg.nsg_id
}

# module "vm" {
#   source              = "./modules/vm"
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   vm_name             = var.vm_name
#   # network_interface_id = module.network_interface.network_interface_id
#   admin_username = var.admin_username
#   admin_password = var.admin_password
# }
