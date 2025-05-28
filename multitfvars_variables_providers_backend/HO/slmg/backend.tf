terraform {
  backend "azurerm" {
    # use_cli              = true                                    # Can also be set via `ARM_USE_CLI` environment variable.
    # use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
    tenant_id            = "a51cc07b-42a2-4f5e-85c8-baef748454e5" # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    resource_group_name  = "akkc_rg"
    storage_account_name = "akkcstorageacc"               # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "slmgstatefile"                # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
