variable "MY-RG" {
  description = "Map of resource group names and locations"
  type = map(object({
    name     = string
    location = string
  }))
}