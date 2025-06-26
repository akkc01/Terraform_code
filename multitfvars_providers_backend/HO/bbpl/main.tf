module "rg_module" {
  source               = "../../modules/resource_group"
  resource_group_name  = var.resource_group_name
 resource_group_name1 = var.resource_group_name1
 location1            = var.location1
  location             = var.location
  tags                 = var.tags
 tags1                = var.tags1

}
