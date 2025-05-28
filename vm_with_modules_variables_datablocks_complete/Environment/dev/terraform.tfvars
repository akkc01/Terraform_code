
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
    pip_name                      = "dev-vm-pip1"

  }
}


nsg-nic-association = {
  nsg-nic-assoc1 = {
    nsg_name            = "dev-nsg1"
    rg_name             = "Akkc-dev-rg-007"
    nic_name            = "dev-vm-001-nic"
    name_security_rule1 = "AllowSSH"
    name_security_rule2 = "AllowRDP"
  }
}

# kv = {
#   kv1 = {
#     name_kv            = "rajkeyvault1245803"
#     name_rg            = "zenai-rg"
#     location           = "westus"
#     sku_name           = "standard"
#     secret_permissions = ["Get", "List", "Set", "Delete", "Backup", "Restore", "Recover", "Purge", ]
#     key_permissions    = ["Get", "List", "Create", "Delete", "Update", "Import", "Backup", "Restore", "Purge", "Recover", ]

#   }
# }

# kvsu = {
#   kvsu1 = {
#     username   = "username-secret"
#     user_value = "devopsadmin"
#     name_kv    = "rajkeyvault1245803"
#     name_rg    = "zenai-rg"
#   }
# }

# kvsp = {
#   kvsp1 = {
#     pswdname  = "password-secret"
#     pas_value = "Passw@rd123"
#     name_kv   = "rajkeyvault1245803"
#     name_rg   = "zenai-rg"
#   }
# }

vm = {
  vm1 = {
    vm_name        = "dev-ubuntu-vm-001"
    rg_name        = "Akkc-dev-rg-007"
    nic_name       = "dev-vm-001-nic"
    location       = "Centralindia"
    vm_size        = "Standard_F2"
    admin_username = "devopsadmin"
    admin_password = "Terraform@2025"
    #name_kv       = "rajkeyvault1245803"
  }
}


