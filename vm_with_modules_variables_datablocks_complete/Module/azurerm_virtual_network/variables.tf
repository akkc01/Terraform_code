variable "vnet" {
  description = "values for the virtual network"
  type = map(object({
    vnet_name     = string
    rg_name       = string
    location      = string
    address_space = list(string)
  }))
}
