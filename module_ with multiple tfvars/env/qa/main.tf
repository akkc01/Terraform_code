module "rg_module" {
  source         = "../../modules/resource_group"
  resource_group = var.resource_group
  location       = var.location
  tags           = var.tags
}
module "sa_module" {
   depends_on = [module.rg_module]
  source                     = "../../modules/storage_account"
  sa_name                    = var.sa_name
  location                   = var.location
  resource_group             = var.resource_group
  account_tier               = var.account_tier
  account_replication_type   = var.account_replication_type
  tags                       = var.tags
 
}
