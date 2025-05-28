terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.24.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "b7df65cvc6-7vncc4d-4e35bvn-98cvn3d-cd66eea0573a"
  client_id       = "a55665df-400cv1-4e2bveb-cn8975-860cbc1eaf0f"
  client_secret   = "g-m8Q~lB6O21A4lLBmbnv9.31KbvaCyK~uep.TOafW"
  tenant_id       = "628e55e0vnbcn-ddbc-4fb1-84df-bb0350248525"
}

