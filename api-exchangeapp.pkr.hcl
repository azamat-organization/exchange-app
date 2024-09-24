source "amazon-ebs" "amazon-back" { 
  ami_name     = "exchange-application-backend-{{timestamp}}"
  // instance_type = var.instance_type
  // region       = var.region
  // source_ami   = var.source_ami
  source_ami = "ami-0f409bae3775dc8e5"
  instance_type = "t2.micro"
  region = "us-east-1"
  ssh_username = "ec2-user"
  tags = {
    CreatedBy = "Packer"
    Purpose   = "api"
  }
}

// describes the build process, how the AMI should be provisioned
build {
  name = "packer-back"
  sources = [
    "source.amazon-ebs.amazon-back"
  ]
  provisioner "shell" { // node & npm installation
    inline = [
      "sudo yum update -y",
      "curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo bash -",
      "sudo yum install -y nodejs",
      "sudo npm install -g npm@9.8.1"
    ]
  }
  provisioner "shell" { // changed ownership to give permissions
    inline = [
      "sudo mkdir /home/ec2-user/api",
      "sudo chown -R ec2-user:ec2-user /home/ec2-user/api"
    ]
  }

  provisioner "file" { // backend codes
    source      = "./api/"
    destination = "/home/ec2-user/api"
  }
  provisioner "shell" { // installing dependencies
    inline = [
      "cd /home/ec2-user/api/ && npm ci"
    ]
  }
  provisioner "file" { // back end service
    source      = "services/back-end.service"
    destination = "/home/ec2-user/"
  }
  provisioner "shell" { // moved service to system directory
    inline = [
      "sudo mv /home/ec2-user/back-end.service /lib/systemd/system/"
    ]
  }
  provisioner "shell" { // systemctl daemon
    inline = [
      "sudo systemctl daemon-reload",
      "sudo systemctl enable --now back-end"
    ]
  }
}