# resource "null_resource" "upload_folder" {
#     connection {
#     type     = "ssh"
#     user     = var.user_name
#     password = var.password
#     host     = var.bvm_pip
#     port     = 22
#   }
  
#  provisioner "file" {
#     source      = var.source_folder
#     destination = var.destination_folder
#   }

# # provisioner "remote-exec" {
# #     inline = var.vm_inline_commands
# #   }

# # provisioner "remote-exec" {
# #     inline = [
# #       "sudo su",
# #       "sudo apt-get update",
# #       "sudo apt-get install -y python3-pip",
# #       "sudo apt-get update && sudo apt-get install -y unixodbc unixodbc-dev",
# #       "curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -",
# #       "curl https://packages.microsoft.com/config/debian/10/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list",
# #       "sudo apt-get update",
# #       "sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17",
# #       "cd /home/varddhaadmin/todoappbackend",
# #       "sudo pip install -r requirements.txt",
# #       "sudo uvicorn app:app --host 0.0.0.0 --port 8000 &"  # Run in background
# #     ]
# #   }

# provisioner "remote-exec" {
#   inline = [
#     "sudo apt-get update",
#     "sudo apt-get install -y python3-pip",
#     "sudo apt-get install -y unixodbc unixodbc-dev",
#     "curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -",
#     "curl https://packages.microsoft.com/config/debian/10/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list",
#     "sudo apt-get update",
#     "sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17",
#     "cd /home/varddhaadmin",
#     "tar -xzvf todoappbackend.tar.gz",
#     "ls -l /home/varddhaadmin",  # debug folder
#     "cd /home/varddhaadmin/todoappbackend",
#     "sudo pip install -r requirements.txt",
#     "sudo uvicorn app:app --host 0.0.0.0 --port 8000 > uvicorn.log 2>&1 &"
#   ]

# }
# }

