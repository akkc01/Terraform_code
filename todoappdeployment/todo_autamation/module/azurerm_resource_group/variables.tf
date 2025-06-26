variable "rg" {
  description = "A map of child resource groups to create."
  type = map(object({
    rg_name  = string
    location = string
  }))
}
