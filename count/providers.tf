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
  subscription_id = "fb85801b-367hfga-4efhgh8-8bhgf37-eahf7a1f71813"
}
