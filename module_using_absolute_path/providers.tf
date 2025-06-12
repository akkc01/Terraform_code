terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
    features {}
  subscription_id = "fb85801b-3fdgdh67a-4egdfhf8-8b3hgfjg7-jeaf7hga1f71813"
}
