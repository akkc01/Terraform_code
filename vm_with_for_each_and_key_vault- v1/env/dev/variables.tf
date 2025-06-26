variable "rgs" {
  description = "A map of root resource groups to create."
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}

variable "storage_accounts" {
  description = "A map of root storage accounts to create."
  type = map(object({
    sa_name                  = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))

}

variable "vnets" {
  description = "A map of root vnets to create."
  type = map(object({
    vnet_name           = string
    resource_group_name = string
    location            = string
    address_space       = list(string)

  }))

}

variable "subnets" {
  description = "A map of root subnets to create."
  type = map(object({
    subnet_name          = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefix       = list(string)

  }))

}

variable "pips" {
  description = "A map of root public IPs to create."
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string
  }))
}


# # variables.tf - Child module variables

variable "nsgs" {
  description = "values for child network security groups to create."
  type = map(object({
    nsg_name            = string
    resource_group_name = string
    location            = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      description                = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}



variable "nics" {
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    pip_name             = string

    ip_configuration = object({
      name = string
      # subnet_id                     = string
      private_ip_address_allocation = string
      #public_ip_address_id          = string
    })

  }))
}

variable "nsg-nic-assoc" {
  description = "values for child network security groups to create."
  type = map(object({
    nsg_name            = string
    resource_group_name = string
    nic_name            = string
  }))
}

variable "key_vaults" {
  description = "A map of root key vaults to create."
  type = map(object({
    kv_name                     = string
    resource_group_name         = string
    location                    = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))

}

variable "key_vaults_secrets" {
  description = "Map of key vault secrets to be created"
  type = map(object({
    kv_name             = string
    resource_group_name = string
    secret_name         = string
    secret_value        = string
  }))

}

variable "kvaps" {
  description = "key vault access polocy"
  type = map(object({
    kv_name             = string
    resource_group_name = string

  }))
}

variable "mssql" {
  description = "mssql server data details"
  type = map(object({
    ss_name             = string
    resource_group_name = string
    location            = string
    version             = string
    minimum_tls_version = string
    kv_name             = string
    sql_username        = string
    sql_password        = string
  }))
}



variable "mssql_db" {
  description = "database details"
  type = map(object({
    mssql_name          = string
    resource_group_name = string
    db_name             = string
    collation           = string
    license_type        = string
    max_size_gb         = string
    sku_name            = string
    enclave_type        = string
  }))
}



variable "vms" {
  type = map(object({
    vm_name             = string
    resource_group_name = string
    location            = string
    size                = string
    nic_name            = string
    kv_name             = string
    user_secrets        = string
    password_secrets    = string


    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}


