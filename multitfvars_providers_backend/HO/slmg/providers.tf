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
  subscription_id = "fb85801b-3gfg67a-4edff8-8b3gfd7-eaf7a1f7ffd1813"
}
