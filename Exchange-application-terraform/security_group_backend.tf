resource "aws_security_group" "backend_sg" {
  name        = var.backend-sg
  description = var.sg_ws_api
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = var.backend-port
    to_port     = var.backend-port
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
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name    = var.sg_backend_tagname
    Project = "demo-assignment"
  }
}