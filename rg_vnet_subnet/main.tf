terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.20.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "f85ee25f-ffbe-4145-896a-4a245999982e"
  tenant_id = "16b80534-097c-4b5a-9fab-f7cb31858160"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "AKKC-EASTUS"
  location = "eastus"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "vnet1"
  address_space       = ["192.168.1.0/24"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  subnet{
    name = "frontend_subnet"
    address_prefixes = ["192.168.1.0/25"]
  }
  
  subnet{
    name = "backend_subnet"
    address_prefixes = ["192.168.1.128/25"]
  }
}

