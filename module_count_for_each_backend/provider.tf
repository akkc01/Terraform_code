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
    key                  = "terraform.tfstate"       # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }


}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "b7dfhjf65c6-7ggfc4d-4bne35-9bn8gf3d-cfgd66egfea0573a"
}


