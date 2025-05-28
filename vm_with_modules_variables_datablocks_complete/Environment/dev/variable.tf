variable "rg" {
  description = "A map of child resource groups to create."
  type = map(object({
    rg_name  = string
    location = string
  }))
}



variable "sa" {
  description = "A map of storage accounts to create."
  type = map(object({
    sa_name                  = string
    rg_name                  = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}


variable "vnet" {
  description = "values for the virtual network"
  type = map(object({
    vnet_name     = string
    rg_name       = string
    location      = string
    address_space = list(string)
  }))
}


variable "subnet" {
  description = "A map of subnets to create."
  type = map(object({
    subnet_name      = string
    rg_name          = string
    vnet_name        = string
    address_prefixes = list(string)
    # service_endpoints    = optional(list(string), [])
    # delegation           = optional(object({
    # name = string
    # service_delegation_name = string
    # }), null)
    # enforce_private_link_endpoint_network_policies = optional(bool, false)
  }))
}


variable "pip" {
  description = "A map of public IPs to create."
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
  }))
}

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


variable "nic" {
  description = "A map of network interfaces to create."
  type = map(object({
    nic_name                      = string
    rg_name                       = string
    location                      = string
    vnet_name                     = string
    subnet_name                   = string
    pip_name                      = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
    subnet_id                     = optional(string)
    public_ip_address_id          = optional(string)

  }))
}

variable "nsg-nic-association" {
  description = "A map of network security group and network interface associations."
  type = map(object({
    nsg_name            = string
    nic_name            = string
    rg_name             = string
    name_security_rule1 = string
    name_security_rule2 = string
  }))
}



# variable "kv" {

# }
# variable "kvsu" {

# }
# variable "kvsp" {

# }


variable "vm" {
  description = "A map of virtual machines to create."
  type = map(object({
    vm_name        = string
    rg_name        = string
    location       = string
    vm_size        = string
    admin_username = string
    admin_password = string
    nic_name       = string
  }))
}


