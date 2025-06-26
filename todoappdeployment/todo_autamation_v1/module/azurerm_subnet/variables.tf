variable "subnet" {
  description = "values for the subnet"
  type = map(object({
    subnet_name          = string
    address_prefix       = string
    resource_group_name  = string
    virtual_network_name = string
  }))
}