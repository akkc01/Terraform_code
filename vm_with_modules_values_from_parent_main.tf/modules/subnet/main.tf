variable "rg_name" {}
variable "vnet_name" {}
variable "subnets" {
  type = list(object({
    name            = string
    address_prefix  = string
  }))
}

resource "azurerm_subnet" "this" {
  for_each = { for s in var.subnets : s.name => s }

  name                 = each.value.name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [each.value.address_prefix]
}

output "subnet_ids" {
  value = [for s in azurerm_subnet.this : s.id]
}
