variable "rgs" {
  description = "A map of child resource groups to create."
  type        = map(object({
    resource_group_name     = string
    location = string
  }))
}
