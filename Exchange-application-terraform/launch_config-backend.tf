resource "aws_launch_configuration" "backend-launch-config" {
  name_prefix   = "backend-launch-config"
  image_id      = var.backend-ami
  instance_type = var.instance-type
  user_data = base64encode(<<-EOF
    #!/bin/bash
    echo -e "\nDB=${jsondecode(data.aws_secretsmanager_secret_version.db_credentials.secret_string)["DB"]}" >> /home/ec2-user/api/app.env
    EOF
  )




  key_name        = "testkeypacker"
  security_groups = ["${aws_security_group.backend_sg.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 10
    encrypted   = true
  }

  lifecycle {
    create_before_destroy = true
  }
}