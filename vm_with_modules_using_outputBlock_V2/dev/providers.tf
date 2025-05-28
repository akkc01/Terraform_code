terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "6gf25fg7007c-ghghec63-4jjfgg876-8b6jgfjgje-dfjfe10f0c83"
}
