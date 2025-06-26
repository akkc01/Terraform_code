resource_group = {
  "rg1" = {
    rg_name  = "varddha-rg001"
    location = "centralindia"
    tags = {
      owner       = "varddha"
      cost_center = "IT"
      environment = "dev"
    }
  }
}

vnet = {
  "vnet1" = {
    vnet_name           = "varddha-vnet001"
    address_space       = ["192.168.5.0/24"]
    location            = "centralindia"
    resource_group_name = "varddha-rg001"
  }
}

subnet = {
  "fsub" = {
    subnet_name          = "frontend-subnet"
    address_prefix       = ["192.168.5.0/25"]
    resource_group_name  = "varddha-rg001"
    virtual_network_name = "varddha-vnet001"
  },
  "bsub" = {
    subnet_name          = "backend-subnet"
    address_prefix       = ["192.168.5.128/25"]
    resource_group_name  = "varddha-rg001"
    virtual_network_name = "varddha-vnet001"
  }
}

pips = {
  "fvm_pip" = {
    pip_name          = "fvm-pip001"
    rg_name           = "varddha-rg001"
    location          = "centralindia"
    allocation_method = "Dynamic"
  },
  "bvm_pip" = {
    pip_name          = "bvm-pip001"
    rg_name           = "varddha-rg001"
    location          = "centralindia"
    allocation_method = "Dynamic"
  }
}

nsgs = {
  "devnsg" = {
    name                = each.value.name_nsg
    location            = each.value.location
    resource_group_name = each.value.name_rg

    security_rule = [
      {
        name                       = "AllowRDP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-HTTP"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-HTTPS"
        priority                   = 300
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

