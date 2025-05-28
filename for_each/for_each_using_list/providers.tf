terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "fb85801b-367afhgfg-4ef8-8b3ghgf7f-eaffg7a1f71813"
}
