variable "nsg" {
  description = "A map of network security groups to create."
  type = map(object({
    nsg_name                = string
    rg_name                 = string
    location                = string
    name_security_rule1     = string
    destination_port_range1 = string
    name_security_rule2     = string
    destination_port_range2 = string
  }))
}
