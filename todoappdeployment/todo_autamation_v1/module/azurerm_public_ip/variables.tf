variable "pips"{
  description = "values for public ip"
  type = map(object({
    pip_name           = string
    rg_name            = string
    location           = string
    allocation_method  = string
  })) 
}

