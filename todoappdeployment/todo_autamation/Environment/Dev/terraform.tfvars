
rg = {
  rg1 = {
    rg_name  = "Akkc-dev-rg-007"
    location = "Centralindia"
  }
}
sa = {
  sa1 = {
    sa_name                  = "Akkcdevsa007"
    rg_name                  = "Akkc-dev-rg-007"
    location                 = "Centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vnet = {
  vnet1 = {
    vnet_name     = "dev-vnet001"
    rg_name       = "Akkc-dev-rg-007"
    location      = "Centralindia"
    address_space = ["10.0.0.0/16"]
  }
}

subnet = {
  sub1 = {
    subnet_name      = "frontend-subnet"
    vnet_name        = "dev-vnet001"
    rg_name          = "Akkc-dev-rg-007"
    address_prefixes = ["10.0.1.0/24"]
  }
  sub2 = {
    subnet_name      = "backend-subnet"
    vnet_name        = "dev-vnet001"
    rg_name          = "Akkc-dev-rg-007"
    address_prefixes = ["10.0.2.0/24"]
  }
}


pip = {
  pip1 = {
    pip_name          = "dev-vm-pip1"
    rg_name           = "Akkc-dev-rg-007"
    location          = "Centralindia"
    allocation_method = "Static"
  }
}

nsg = {
  nsg1 = {
    nsg_name                = "dev-nsg1"
    rg_name                 = "Akkc-dev-rg-007"
    location                = "Centralindia"
    name_security_rule1     = "AllowSSH"
    destination_port_range1 = "22"
    name_security_rule2     = "AllowRDP"
    destination_port_range2 = "3389"
  }
}

nic = {
  nic1 = {
    nic_name                      = "dev-vm-001-nic"
    rg_name                       = "Akkc-dev-rg-007"
    location                      = "Centralindia"
    ip_configuration_name         = "dev-vm-001-ipconfig"
    private_ip_address_allocation = "Dynamic"
    vnet_name                     = "dev-vnet001"
    subnet_name                   = "frontend-subnet"
    #nsg_name                      = "dev-nsg1"
    pip_name = "dev-vm-pip1"

  }
}


nsg-nic-association = {
  nsg-nic-assoc1 = {
    nsg_name            = "devvm-nsg"
    nic_name            = "dev-vm-001-nic"
    rg_name             = "Akkc-dev-rg-007"
    name_security_rule1 = "AllowSSH"
    name_security_rule2 = "AllowRDP"
  }
}


vm = {
  vm1 = {
    vm_name        = "devvm-007"
    rg_name        = "Akkc-dev-rg-007"
    location       = "Centralindia"
    vm_size        = "Standard_F2"
    admin_username = "akkcadmin"
    admin_password = "Surveillance1@123"
    #network_interface_ids = ["/subscriptions/xxx/resourceGroups/Akkc-dev-rg-007/providers/Microsoft.Network/networkInterfaces/dev-vm-001-nic"]

    os_disk = {
      os_disk_caching              = "ReadWrite"
      os_disk_storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
  }
}



