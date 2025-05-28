terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.23.0"
    }
  }

# we use the azurerm backend to store the Terraform state file in an Azure Storage Account.
  backend "azurerm" {
    resource_group_name  = "akkcstorageaccount"      # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "akkcstorageaccountak123" # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "azurecontainer"          # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "akterraform.tfstate"       # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }



}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "b7df65c6-7c4d-4e35-983d-cd66eea0573a"
  # client_id       = "a55665df-4001-4vcxe2e-8975-860cbc1eaf0f"
  # client_secret   = var.client_secret
  # tenant_id       = "628e55e0-cxb-4fb1-cxbcx84df-bb0350248525"
}
