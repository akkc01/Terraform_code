variable "pip" {
  description = "A map of public IPs to create."
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
  }))
}
