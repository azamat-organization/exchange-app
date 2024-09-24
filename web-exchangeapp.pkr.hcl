source "amazon-ebs" "amazon" { //instance ami configurations
  ami_name = "exchange-application-frontend-{{timestamp}}"
  // instance_type = var.instance_type
  // region = var.region
  // source_ami = var.source_ami
  source_ami = "ami-0f409bae3775dc8e5"
  instance_type = "t2.micro"
  region = "us-east-1"
  ssh_username = "ec2-user"
  tags = {
    CreatedBy = "Packer"
    Purpose   = "web"
  }
}
build {
  name = "packer-front"
  sources = [
    "source.amazon-ebs.amazon"
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
      "sudo mkdir /home/ec2-user/web",
      "sudo chown -R ec2-user:ec2-user /home/ec2-user/web"
    ]
  }
  provisioner "file" { // frontend codes
    source      = "./web/"
    destination = "/home/ec2-user/web"
  }
  provisioner "shell" { // installing dependencies
    inline = [
      "cd /home/ec2-user/web/ && npm ci"
    ]
  }
  provisioner "file" { // front end service
    source      = "services/front-end.service"
    destination = "/home/ec2-user/"
  }
  provisioner "shell" { // moved service to system directory
    inline = [
      "sudo mv /home/ec2-user/front-end.service /lib/systemd/system/"
    ]
  }
  provisioner "shell" { // systemctl daemon
    inline = [
      "sudo systemctl daemon-reload",
      "sudo systemctl enable --now front-end"
    ]
  }
}