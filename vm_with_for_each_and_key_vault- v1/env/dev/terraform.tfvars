rgs = {
  rg1 = {
    resource_group_name = "my-darling"
    location            = "centralindia"
  },
  rg2 = {
    resource_group_name = "bbplrg"
    location            = "centralindia"
  }
}

storage_accounts = {
  str1 = {
    sa_name                  = "darlingsa001"
    resource_group_name      = "my-darling"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

vnets = {
  vnet1 = {
    vnet_name           = "darling-vnet"
    address_space       = ["192.168.1.0/24"]
    resource_group_name = "my-darling"
    location            = "centralindia"
  },
  vnet2 = {
    vnet_name           = "honey-vnet"
    resource_group_name = "bbplrg"
    address_space       = ["192.168.2.0/24"]
    location            = "centralindia"
  }
}

subnets = {
  sub1 = {
    subnet_name          = "darlingsub1"
    resource_group_name  = "my-darling"
    virtual_network_name = "darling-vnet"
    address_prefix       = ["192.168.1.0/25"]
  },
  sub2 = {
    subnet_name          = "darlingsub2"
    resource_group_name  = "my-darling"
    virtual_network_name = "darling-vnet"
    address_prefix       = ["192.168.1.128/25"]
  }

  sub3 = {
    subnet_name          = "honeysub1"
    virtual_network_name = "honey-vnet"
    resource_group_name  = "bbplrg"
    address_prefix       = ["192.168.2.0/25"]
  },
  sub4 = {
    subnet_name          = "honeysub2"
    virtual_network_name = "honey-vnet"
    resource_group_name  = "bbplrg"
    address_prefix       = ["192.168.2.128/25"]
  }

}

pips = {
  pip1 = {
    pip_name            = "darlingvm-ip"
    resource_group_name = "my-darling"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  },
  pip2 = {
    pip_name            = "honeyvm-ip"
    resource_group_name = "my-darling"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}



nsgs = {
  "nsg1" = {
    nsg_name            = "darling-nsg"
    location            = "centralindia"
    resource_group_name = "my-darling"
    security_rules = [
      {
        name                       = "allowssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        description                = "Allow SSH"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allowhttp"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        description                = "Allow HTTP"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  },
  "nsg2" = {
    nsg_name            = "honey-nsg"
    location            = "centralindia"
    resource_group_name = "my-darling"
    security_rules = [
      {
        name                       = "Allowssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        description                = "Allow SSH"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allowhttp"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        description                = "Allow HTTP"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}



nics = {
  "nic1" = {
    nic_name             = "darlingvm-nic"
    resource_group_name  = "my-darling"
    location             = "centralindia"
    subnet_name          = "darlingsub1"
    virtual_network_name = "darling-vnet"
    pip_name             = "darlingvm-ip"


    ip_configuration = {
      name                          = "darlingvmip-config"
      private_ip_address_allocation = "Dynamic"



    }
  },
  "nic2" = {
    nic_name             = "honeyvm-nic"
    resource_group_name  = "my-darling"
    location             = "centralindia"
    subnet_name          = "darlingsub2"
    virtual_network_name = "darling-vnet"
    pip_name             = "honeyvm-ip"


    ip_configuration = {
      name                          = "honeyvmip-config"
      private_ip_address_allocation = "Dynamic"
    }
  }
}


nsg-nic-assoc = {
  nsg-nic-assoc1 = {
    nsg_name            = "darling-nsg"
    nic_name            = "darlingvm-nic"
    resource_group_name = "my-darling"
  },
  nsg-nic-assoc2 = {
    nsg_name            = "honey-nsg"
    nic_name            = "honeyvm-nic"
    resource_group_name = "my-darling"
  },
}

key_vaults = {
  "kv1" = {
    kv_name                     = "darlingkv"
    resource_group_name         = "my-darling"
    location                    = "centralindia"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
  }
}

key_vaults_secrets = {
  "secret1" = {
    kv_name             = "darlingkv"
    resource_group_name = "my-darling"
    secret_name         = "vmusername1"
    secret_value        = "darlingadmin"
  },
  "secret2" = {
    kv_name             = "darlingkv"
    resource_group_name = "my-darling"
    secret_name         = "vmpassword1"
    secret_value        = "honey@4321"
  },
  "secret3" = {
    kv_name             = "darlingkv"
    resource_group_name = "my-darling"
    secret_name         = "vmusername2"
    secret_value        = "honeyadmin"
  },
  "secret4" = {
    kv_name             = "darlingkv"
    resource_group_name = "my-darling"
    secret_name         = "vmpassword2"
    secret_value        = "darling@4321"
  },
  "secret5" = {
    kv_name             = "darlingkv"
    resource_group_name = "my-darling"
    secret_name         = "sqlusername"
    secret_value        = "darlingadmin"
  },
  "secret6" = {
    kv_name             = "darlingkv"
    resource_group_name = "my-darling"
    secret_name         = "sqlpassword"
    secret_value        = "honey@4321"
  }
}

kvaps = {
  "policy1" = {
    kv_name             = "darlingkv"
    resource_group_name = "my-darling"
  }
}

mssql = {
  "sql_server1" = {
    ss_name             = "darlingsqlserver"
    resource_group_name = "my-darling"
    location            = "centralindia"
    version             = "12.0"
    minimum_tls_version = "1.2"
    kv_name             = "darlingkv"
    sql_username        = "sqlusername"
    sql_password        = "sqlpassword"

  }
}


mssql_db = {
  "db1" = {
    mssql_name          = "darlingsqlserver"
    resource_group_name = "my-darling"
    db_name             = "darlingdb"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
  },
  "db2" = {
    mssql_name          = "darlingsqlserver"
    resource_group_name = "my-darling"
    db_name             = "honeydb"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
  }
}

vms = {
  "vm1" = {
    vm_name             = "darlingvm-linux001"
    resource_group_name = "my-darling"
    location            = "centralindia"
    size                = "Standard_F2"
    kv_name             = "darlingkv"
    user_secrets        = "vmusername1"
    password_secrets    = "vmpassword1"
    nic_name            = "darlingvm-nic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

  "vm2" = {
    vm_name             = "honeyvm-linux001"
    resource_group_name = "my-darling"
    location            = "centralindia"
    size                = "Standard_B2s"
    kv_name             = "darlingkv"
    nic_name            = "honeyvm-nic"
    user_secrets        = "vmusername2"
    password_secrets    = "vmpassword2"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
