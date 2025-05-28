module "rg" {
  source = "../modules/rg"
  rgs    = var.rgs
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../modules/vnet"
  vnets      = var.vnets

}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../modules/subnet"
  subnets    = var.subnets
}

module "pip" {
  depends_on = [module.rg, module.vnet]
  source     = "../modules/pip"
  pips       = var.pips
}

module "nsg" {
  depends_on = [module.rg, module.vnet]
  source     = "../modules/nsg"
  nsgs       = var.nsgs
}

module "nic" {
  depends_on = [module.rg, module.vnet, module.subnet, module.pip, module.nsg]
  source     = "../modules/nic"
  nics       = var.nics
  subnet_id  = module.subnet.subnet_ids_map["sub1"]
  nsg_id     = module.nsg.nsg_ids_map["nsg1"]
  pip_id     = module.pip.pip_ids_map["pip1"]
}

module "vm" {
  depends_on = [module.rg, module.vnet, module.subnet, module.pip, module.nsg, module.nic]
  source     = "../modules/vm"
  vm         = var.vm
  nic_id    = module.nic.nic_ids_map["nic1"]
}