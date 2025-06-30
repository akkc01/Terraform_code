resource "null_resource" "upload_frontend_folder" {
    connection {
    type     = "ssh"
    user     = var.user_name
    password = var.password
    host     = var.fvm_pip
    port     = 22
  }
  
 provisioner "file" {
    source      = var.frontend_source_folder
    destination = var.frontend_destination_folder
  } 



 provisioner "remote-exec" {
  inline = [
    "cd /home/varddhaadmin",
    "echo 'Extracting build.tar.gz...'",
    "tar -xzvf build.tar.gz",
    "cd /home/varddhaadmin/build",
    "echo 'Copying files to /var/www/html/ (including hidden files)...'",
    # Copy all contents recursively (includes hidden files)
    "sudo cp -r . /var/www/html/"

    #it will Copy all non-hidden(matlab hidden files ko copy nhi karega)files recursively from current folder to /var/www/html/
    #"sudo cp -r ./* /var/www/html/"

    ]
  }
 
}

