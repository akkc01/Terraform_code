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
  subscription_id = "6xcv257vz007c-cxcbvcxbdgxb-48dfgs7gs6-8cxbb6gfdge-df96efgd10f0c83"
}
