locals {
  env_config = var.environment_config[terraform.workspace]
}

module "resource_groups" {
  source          = "../modules/azurerm_resource_group"
  resource_groups = local.env_config.resource_groups
}

module "vnets" {
  source  = "../modules/azurerm_virtual_network"
  env     = terraform.workspace
  vnets   = local.env_config.vnets
}



locals {
  all_subnets = {
    for subnet_key, subnet in local.env_config.subnets :
    subnet_key => {
      name                = subnet.name
      address_prefix      = subnet.address_prefix
      resource_group_name = subnet.resource_group_name
      vnet_name           = subnet.vnet_name
    }
  }
}

module "subnets" {
  source  = "../modules/azurerm_subnet"
  subnets = local.all_subnets
}


locals {
 # env_config = var.environment_config[terraform.workspace]
  public_ips = {
    for pip_key, pip in local.env_config.public_ips :
    pip_key => {
      name                = pip.name
      location            = pip.location
      resource_group_name = pip.resource_group_name
      allocation_method   = pip.allocation_method
      sku                 = pip.sku
    }
  }
}


module "public_ips" {
  source     = "../modules/azurerm_public_ip"
  public_ips = local.public_ips
}

locals {
 # env_config = var.environment_config[terraform.workspace]

  network_security_groups = {
    for k, nsg in local.env_config.network_security_groups :
    k => nsg
  }

  network_interfaces = {
    for k, nic in local.env_config.network_interfaces :
    k => {
      name                         = nic.name
      location                     = nic.location
      resource_group_name          = nic.resource_group_name
      subnet_id                    = nic.subnet_id
      vnet_name                    = local.env_config.vnets["app"].name != null ? "app-vnet-${terraform.workspace}" : ""
      public_ip_name               = nic.public_ip_name
      network_security_group_name = nic.network_security_group_name
    }
  }
}

module "nsgs" {
  source = "../modules/azurerm_NSG"
  nsgs   = local.network_security_groups
}

module "nics" {
  source = "../modules/azurerm_NIC"
  nics   = local.network_interfaces
}
