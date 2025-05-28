terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "62567007c-ec4563-4546587657457-8b6545e-74df96e10f0c83"

}
