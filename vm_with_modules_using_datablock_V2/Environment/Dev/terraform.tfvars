
rg = {
  rg1 = {
    name     = "zenai-rg"
    location = "westus"
  }
}
sa = {
  sa1 = {
    name                     = "examplestorageaccta"
    resource_group_name      = "zenai-rg"
    location                 = "westus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vnet = {
  vnet1 = {
    name                = "zenai-vnet"
    resource_group_name = "zenai-rg"
    location            = "westus"
    address_space       = ["10.0.0.0/16"]
  }
}

snet = {
  snet1 = {
    name        = "frontend-subnet"
    name_vnet        = "zenai-vnet"
    name_rg          = "zenai-rg"
    address_prefixes = ["10.0.1.0/26"]
  }
  snet2 = {
    name_snet        = "backend-subnet"
    name_vnet        = "zenai-vnet"
    name_rg          = "zenai-rg"
    address_prefixes = ["10.0.2.0/26"]
  }
}

nic = {
  nic1 = {
    name                      = "zenaivm-nic"
    resource_group_name = "zenai-rg"
    location            = "westus"
    name_ip                       = "zenips"
    private_ip_address_allocation = "Dynamic"
    name_pip                      = "zenai-vm-pip"
    name_snet                     = "frontend-subnet"
    name_vnet                     = "zenai-vnet"
    name_nsg                      = "zenai-nsg"
  }
}

pip = {
  pip1 = {
    name_pip          = "zenai-vm-pip"
    name_rg           = "zenai-rg"
    location          = "westus"
    allocation_method = "Static"
  }
}

nsg = {
  nsg1 = {
    name               = "zenai-nsg"
    resource_group_name                = "zenai-rg"
    location               = "westus"
    name_security_rule     = "sec"
    destination_port_range = "22"
        name                       = each.value.name_security_rule
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

kv = {
  kv1 = {
    name_kv            = "rajkeyvault1245803"
    name_rg            = "zenai-rg"
    location           = "westus"
    sku_name           = "standard"
    secret_permissions = ["Get", "List", "Set", "Delete", "Backup", "Restore", "Recover", "Purge", ]
    key_permissions    = ["Get", "List", "Create", "Delete", "Update", "Import", "Backup", "Restore", "Purge", "Recover", ]

  }
}

kvsu = {
  kvsu1 = {
    username   = "username-secret"
    user_value = "devopsadmin"
    name_kv    = "rajkeyvault1245803"
    name_rg    = "zenai-rg"
  }
}

kvsp = {
  kvsp1 = {
    pswdname  = "password-secret"
    pas_value = "Passw@rd123"
    name_kv   = "rajkeyvault1245803"
    name_rg   = "zenai-rg"
  }
}

vm = {
  vm1 = {
    name_vm       = "zenaivm"
    name_rg       = "zenai-rg"
    location      = "westus"
    vm_size       = "Standard_F2"
    name_username = "username-secret"
    name_password = "password-secret"
    name_nic      = "zenaivm-nic"
    name_kv       = "rajkeyvault1245803"
  }
}

nsg-nic-assoc = {
  nsg-nic-assoc1 = {
    name_nsg           = "zenai-nsg"
    name_rg            = "zenai-rg"
    name_nic           = "zenaivm-nic"
    name_security_rule = "sec"
  }
}
