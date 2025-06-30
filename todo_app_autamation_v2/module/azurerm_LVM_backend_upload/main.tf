resource "null_resource" "upload_folder" {
    connection {
    type     = "ssh"
    user     = var.user_name
    password = var.password
    host     = var.bvm_pip
    port     = 22
  }
  
 provisioner "file" {
    source      = var.source_folder
    destination = var.destination_folder
  } 
 provisioner "remote-exec" {
    inline = [
      "cd /home/varddhaadmin",
      "tar -xzvf todoappbackend.tar.gz",
      "cd /home/varddhaadmin/todoappbackend",
      "sudo apt update && sudo apt install -y python3-pip",
      "sudo -H pip3 install -r requirements.txt",
      #"sudo pip3 install -r requirements.txt",
      #"uvicorn app:app --host 0.0.0.0 --port 8000",
      "nohup uvicorn app:app --host 0.0.0.0 --port 8000 > uvicorn.log 2>&1 &"
      
      
    ]
  }
 
}

