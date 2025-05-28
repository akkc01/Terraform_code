rgs = {
  rg1 = {
    name     = "dev_rg1"
    location = "East US"
  }
}

vnets = {
  vnet1 = {
    name                = "devvnet1"
    address_space       = ["192.168.1.0/24"]
    resource_group_name = "dev_rg1"
    location            = "East US"
  }
}

subnets = {
  sub1 = {
    name                = "devsub1"
    resource_group_name = "dev_rg1"
    #id                   = "sub1-id"
    subnet_key           = "devsub1"
    virtual_network_name = "devvnet1"
    address_prefixes     = ["192.168.1.0/25"]
  },
  sub2 = {
    name                = "devsub2"
    resource_group_name = "dev_rg1"
    # id                   = "sub2-id"
    subnet_key           = "devsub2"
    virtual_network_name = "devvnet1"
    address_prefixes     = ["192.168.1.128/25"]
  }
}


pips = {
  pip1 = {
    name                = "pip-nic1"
    location            = "East US"
    resource_group_name = "dev_rg1"
  }
}

nsgs = {
  nsg1 = {
    name                = "nsg-nic1"
    location            = "East US"
    resource_group_name = "dev_rg1"
  }
}

nics = {
  nic1 = {
    name                = "nic1"
    location            = "East US"
    resource_group_name = "dev_rg1"
    subnet_key          = "devsub1"

  }
}


vm = {
  vm1 = {
    name                  = "dev-vm1"
    resource_group_name   = "dev_rg1"
    location              = "East US"
    size                  = "Standard_F2s"
    admin_username        = "azureuser"
    admin_password        = "P@ssw0rd1234!"
    #network_interface_ids = ["nic1"]

    os_disk = {
      name                 = "vm1-osdisk"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2022-Datacenter"
      version   = "latest"
    }

  }

}
