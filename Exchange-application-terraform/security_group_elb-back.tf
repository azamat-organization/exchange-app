resource "aws_security_group" "elb_sg-back" {
  name        = var.sg_name-back
  description = var.sg_description
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = var.app-port
    to_port     = var.app-port
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
    Name    = var.sg_tagname_back
    Project = "back ALB"
  }
}