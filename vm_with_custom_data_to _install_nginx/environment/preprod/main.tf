module "rg" {
  source              = "../../module/azurerm_resource_group"
  resource_group_name = "akkc-rg-007"
  location            = "East US"
}

module "vnet" {
  source               = "../../module/azurerm_virtual_network"
  virtual_network_name = "akkc-vnet-007"
  resource_group_name  = "akkc-rg-007"
  location             = "East US"
  depends_on = [ module.rg ]
}

module "subnet" {
  source               = "../../module/azurerm_subnet"
  subnet_name          = "akkc-subnet-007"
  virtual_network_name = "akkc-vnet-007"
  resource_group_name  = "akkc-rg-007"
  depends_on = [ module.rg, module.vnet ]

}

module "nsg" {
  source              = "../../module/azurerm_network_security_group"
  nsg_name            = "akkc-nsg-007"
  resource_group_name = "akkc-rg-007"
  location            = "East US"
  depends_on = [ module.rg ]

}

module "pip" {
  source              = "../../module/azurerm_public_ip"
  pip_name            = "akkc-pip-007"
  resource_group_name = "akkc-rg-007"
  location            = "East US"
  depends_on = [ module.rg ]
}

module "nic" {
  source               = "../../module/azurerm_network_interface_card"
  nic_name             = "akkc-nic-007"
  resource_group_name  = "akkc-rg-007"
  location             = "East US"
  subnet_name          = "akkc-subnet-007"
  public_ip_name       = "akkc-pip-007"
  virtual_network_name = "akkc-vnet-007"
  depends_on = [ module.rg, module.vnet, module.subnet, module.pip, module.nsg ]
}


module "nic_nsg_association" {
  source              = "../../module/azurerm_nic_nsg_association"
  nsg_name            = "akkc-nsg-007"
  nic_name            = "akkc-nic-007"
  resource_group_name = "akkc-rg-007"
  depends_on = [ module.rg, module.nic, module.nsg ]
}

module "vm" {
  source              = "../../module/azurerm_linux_virtual_machine"
  vm_name             = "akkc-vm-007"
  resource_group_name = "akkc-rg-007"
  location            = "East US"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd1234!"
  nic_name            = "akkc-nic-007"
  depends_on = [ module.rg, module.nic]

}
