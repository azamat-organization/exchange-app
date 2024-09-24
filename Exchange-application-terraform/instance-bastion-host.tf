resource "aws_instance" "Bastion-Host" {
  ami                    = var.frontend-ami
  instance_type          = var.instance-type
  key_name               = "testkeypacker"
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]
  subnet_id              = aws_subnet.pub_sub1.id
  tags = {
    Name = "bastion_tf"
  }
}