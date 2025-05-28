variable "child_rg" {
  description = "A map of child resource groups to create."
  type        = map(object({
    name     = string
    location = string
  }))
}
