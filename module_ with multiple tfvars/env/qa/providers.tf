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
  subscription_id = "fb85801b-bbvb367cvacv-4ecvvcnf8-8bncvn37bn-eaf7a1f71bv813"
}
