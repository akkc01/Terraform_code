# sa_name = "qualitysa512"
# location = "centralindia"
# resource_group = "quality_rg"
# account_tier = "Standard"
# account_replication_type = "LRS"
tags = {
  environment = "quality"
  owner       = "akkc"
}

# we can break the terraform.tfvars file into multiple files for better organization and readability.
# For example, we can create a file named "rg1.auto.tfvars" for the resource group and another file named "rg2.auto.tfvars" for the storage account.