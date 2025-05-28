terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.23.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = "a55665df-4001-4e2e-8975-860cbc1eaf0f"
  client_secret   = "bYA8Q~plknoIcHuSWLsU18xzTgDMe5hbyDTk4dfv"
  tenant_id       = "628e55e0-ddbc-4fb1-84df-bb0350248525"
  subscription_id = "b7df65c6-7c4d-4e35-983d-cd66eea0573a"
}