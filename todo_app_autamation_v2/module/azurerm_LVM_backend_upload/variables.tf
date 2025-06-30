variable "user_name" {
  description = "The name of the user to be created in the SQL Database."
  type        = string
}

variable "password" {
  description = "The password for the user to be created in the SQL Database."
  type        = string
}

variable "bvm_pip" {
  description = "The public IP address of the backend virtual machine."
  type        = string
  
}

variable "source_folder" {
  description = "The path to the folder to be uploaded to the backend virtual machine."
  type        = string
  
}

variable "destination_folder" {
  description = "The path on the backend virtual machine where the folder will be uploaded."
  type        = string
  
}

# variable "vm_inline_commands" {
#   description = "The inline commands to be executed on the backend virtual machine after uploading the folder."
#   type        = list(string)
#   default     = [
#     "cd ${var.destination_folder}",
#     "tar -xzvf myfolder.tar.gz",
#     "ls -l ${var.destination_folder}/myfolder"
#   ]
  
#}