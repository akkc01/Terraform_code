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
  client_id       = "3346-54354001-4e2e-8975643-860cbc1eaf0f"
  client_secret   = "bYA8Q~plknoIcHuSWLsU143668xzTgDMe5hbyDTk4dfv"
  tenant_id       = "628e34655e0-ddbc-4fb1-84346df-bb0364350248525"
  subscription_id = "b7df36465c6-7c4634d-4e35-9436683d-cd66eea0573a"
}
