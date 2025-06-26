variable "vnets" {
  type = map(object({
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))
}

variable "env" {
  type = string
}
