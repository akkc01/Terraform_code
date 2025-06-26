variable "pips" {
  description = "A map of child public IPs to create."
  type = map(object({
    pip_name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string
  }))
}