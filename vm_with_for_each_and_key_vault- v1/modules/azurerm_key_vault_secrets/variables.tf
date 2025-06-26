variable "key_vaults_secrets" {
  description = "Map of key vault secrets to be created"
  type = map(object({
    kv_name             = string
    resource_group_name = string
    secret_name         = string
    secret_value        = string
  }))

}
