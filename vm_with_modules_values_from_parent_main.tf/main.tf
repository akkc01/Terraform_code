terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "d4681c5e-21a1-405d-a6b7-3c3a7b517e85"
}


module "rg" {
  source      = "./modules/rg"
  rg_name     = "demo-rg"
  location    = "East US"
}

module "vnet" {
  source      = "./modules/vnet"
  rg_name     = module.rg.rg_name
  location    = module.rg.location
  vnet_name   = "demo-vnet"
  address_space = ["10.0.0.0/16"]
}

module "subnet" {
  source        = "./modules/subnet"
  rg_name       = module.rg.rg_name
  vnet_name     = module.vnet.vnet_name
  subnets = [
    { name = "subnet1", address_prefix = "10.0.1.0/24" },
    { name = "subnet2", address_prefix = "10.0.2.0/24" }
  ]
}

module "nsg" {
  source    = "./modules/nsg"
  rg_name   = module.rg.rg_name
  nsg_name  = "demo-nsg"
  location  = module.rg.location
}

module "pip" {
  source     = "./modules/pip"
  rg_name    = module.rg.rg_name
  location   = module.rg.location
  pip_name   = "demo-pip"
}

module "nic" {
  source       = "./modules/nic"
  rg_name      = module.rg.rg_name
  location     = module.rg.location
  nic_name     = "demo-nic"
  subnet_id    = module.subnet.subnet_ids[0]
  pip_id       = module.pip.pip_id
  nsg_id       = module.nsg.nsg_id
}

module "vm" {
  source        = "./modules/vm"
  rg_name       = module.rg.rg_name
  location      = module.rg.location
  nic_id        = module.nic.nic_id
  vm_name       = "demo-win-vm"
  admin_user    = "azureuser"
  admin_password = "P@ssword1234!"
}
