variable "nsg-nic-association" {
  description = "A map of network security group and network interface associations."
  type = map(object({
    nsg_name = string
    nic_name = string
    rg_name = string
    name_security_rule1     = string
    name_security_rule2     = string
  }))
}
