resource "aws_launch_configuration" "frontend-launch-config" {
  name_prefix     = "frontend-launch-config"
  image_id        = var.frontend-ami
  instance_type   = var.instance-type
  user_data       = <<-EOF
              #!/bin/bash
              sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3001
              echo "API_HOST=http://${aws_lb.backend-lb.dns_name}" >> /home/ec2-user/web/app.env
              echo "PORT=3001" >> /home/ec2-user/web/app.env
              EOF
  key_name        = "testkeypacker"
  security_groups = ["${aws_security_group.frontend_sg.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 10
    encrypted   = true
  }

  lifecycle {
    create_before_destroy = true
  }
}