variable "kvaps" {
  description = "key vault access polocy"
  type = map(object({
    kv_name             = string
    resource_group_name = string

  }))
}
