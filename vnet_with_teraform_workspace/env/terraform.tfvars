environment_config = {
  dev = {
    resource_groups = {
      rg1 = {
        name     = "rg-dev-1"
        location = "East US"
      }
    }
    vnets = {
      app = {
        address_space       = ["10.0.0.0/16"]
        location            = "East US"
        resource_group_name = "rg-dev-1"
      }
      # db = {
      #   address_space       = ["10.1.0.0/16"]
      #   location            = "East US"
      #   resource_group_name = "rg-dev-1"
      # }
    }

    subnets = {
      frontend = {
        name                = "frontend"
        address_prefix      = "10.0.1.0/24"
        resource_group_name = "rg-dev-1"
        vnet_name           = "app-vnet-dev"
      }
      backend = {
        name                = "backend"
        address_prefix      = "10.0.2.0/24"
        resource_group_name = "rg-dev-1"
        vnet_name           = "app-vnet-dev"
      }
    }
    public_ips = {
      pip1 = {
        name                = "devvm-pip-1"
        location            = "East US"
        resource_group_name = "rg-dev-1"
        allocation_method   = "Static"
        sku                 = "Standard"
      }
      pip2 = {
        name                = "devvm-pip-2"
        location            = "East US"
        resource_group_name = "rg-dev-1"
        allocation_method   = "Static"
        sku                 = "Standard"
      }
    }

    network_security_groups = {
      web-nsg = {
        name                = "web-nsg"
        location            = "East US"
        resource_group_name = "rg-dev-1"
      }
    }

    network_interfaces = {
      devvm-nic1 = {
        name                = "web-nic"
        location            = "East US"
        resource_group_name = "rg-dev-1"
        subnet_id           = "frontend"
        public_ip_name      = "dev-pip-1"
        network_security_group_name = "web-nsg"
      }
      devvm-nic2 = {
        name                = "web-nic"
        location            = "East US"
        resource_group_name = "rg-dev-1"
        subnet_id           = "frontend"
        public_ip_name      = "dev-pip-1"
        network_security_group_name = "web-nsg"
      }
    }


  }

  prod = {
    resource_groups = {
      rg1 = {
        name     = "rg-prod-1"
        location = "West Europe"
      }
    }
    vnets = {
      core = {
        address_space       = ["192.168.0.0/16"]
        location            = "West Europe"
        resource_group_name = "rg-prod-1"
      }
    }
    subnets = {
      frontend = {
        name                = "frontend"
        address_prefix      = "10.0.1.0/24"
        resource_group_name = "rg-prod-1"
        vnet_name           = "core-vnet-prod"
      }
      backend = {
        name                = "backend"
        address_prefix      = "10.0.2.0/24"
        resource_group_name = "rg-prod-1"
        vnet_name           = "core-vnet-prod"
      }
    }
    public_ips = {
      pip1 = {
        name                = "prodvm-pip-1"
        location            = "West Europe"
        resource_group_name = "rg-prod-1"
        allocation_method   = "Static"
        sku                 = "Standard"
      }
      pip2 = {
        name                = "prodvm-pip-2"
        location            = "West Europe"
        resource_group_name = "rg-prod-1"
        allocation_method   = "Static"
        sku                 = "Standard"
      }
    }

  }
}
