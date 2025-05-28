

module "rg_module" {
  source = "D:\\DevOps\\terraform\\tf_module2\\resoure_group"
  # for source path here we use the absolute path of resource_group module
  # for the same we can use the relative path as well
  # like source = "../resoure_group"
  
}

module "sa_module" {
  depends_on = [module.rg_module]
  # depends_on is used to ensure that the resource group is created before the storage account
  # This is important because the storage account needs to be associated with a resource group.
  source = "D:\\DevOps\\terraform\\tf_module2\\Storage_account"
  # for source path here we use the absolute path of storage_account module

}

