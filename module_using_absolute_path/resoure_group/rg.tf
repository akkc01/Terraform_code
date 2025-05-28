    resource "azurerm_resource_group" "rg" {
        name     = "akkc_rg"
        location = "centralindia"
    }
    
    # Output the resource group name
    output "rg_name" {
        value = azurerm_resource_group.rg.name
    }
