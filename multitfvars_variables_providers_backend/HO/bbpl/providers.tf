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
  subscription_id = "fb85801b-36gfdg7a-4gdfef8-8bfgdg37-fhfdeaf7a1f71813"
}
