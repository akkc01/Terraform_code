variable "nsg-nic-assoc" {
  description = "values for child network security groups to create."
  type = map(object({
    nsg_name            = string
    resource_group_name = string
    nic_name            = string
  }))
}
