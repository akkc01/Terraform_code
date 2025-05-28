variable "my_rg" {
  description = "List of resource groups to create with name and location."
  type = list(object({
    name     = string
    location = string
  }))
}
