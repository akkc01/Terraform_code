variable "resource_group" {
  description = "values for the resource group"
  type = map(object({
    rg_name  = string
    location = string
    tags = map(object({
      # Tags for the resource group
      owner       = string
      cost_center = string
      environment = string

    }))
  }))
}

