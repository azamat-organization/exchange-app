resource "aws_security_group" "frontend_sg" {
  name        = var.sg_ws_name
  description = var.sg_ws_web
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = var.app-port
    to_port     = var.app-port
    protocol    = "tcp"
    description = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = var.ssh-port
    to_port     = var.ssh-port
    protocol    = "tcp"
    description = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.temp-port
    to_port     = var.temp-port
    protocol    = "tcp"
    description = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name    = var.sg_ws_web
    Project = "demo-assignment"
  }
}