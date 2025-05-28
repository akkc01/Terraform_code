# variable "root_rg" {
#   description = "A map of root resource groups to create."
#   type = map(object({
#     name     = string
#     location = string
#   }))
# }

variable "rg_prod" {
  description = "A map of root resource groups to create."
  type = list(string)
}

variable "rg_loc" {
  description = "A map of root resource groups to create."
  type = list(string)
}
