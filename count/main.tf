# resource "azurerm_resource_group" "arrr" {
#   count = 4
#   name     = "rg-${count.index+1}"
#   location = "East US"
# }


resource "azurerm_resource_group" "rg_prod" {
  count    = length(var.rg_prod)
  #name     = var.rg_prod[count.index]
  name = "${var.rg_prod[count.index]}-${var.rg_loc[count.index]}"
  location = var.rg_loc[count.index]
}


# To delete a specific resource group, you can use the -target option with terraform destroy command.
# This allows you to specify the resource you want to destroy without affecting the others.

# terraform destroy -target="azurerm_resource_group.rg_prod[<index>]"
# terraform destroy -target="azurerm_resource_group.rg_prod[1]"

#---------------------------------------------------------------------------

# Use Azure CLI (manual method)
# az group delete --name <resource-group-name> --yes --no-wait
# az group delete --name rg-production1-eastus --yes --no-wait
