resource "aws_lb_target_group" "backend-tg" {
  name       = "backend-tg"
  depends_on = [aws_vpc.main]
  port       = 3000
  protocol   = "HTTP"
  vpc_id     = aws_vpc.main.id
  health_check {
    interval            = 70
    path                = "/healthcheck"
    port                = 3000
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 60
    protocol            = "HTTP"
    matcher             = "200,202"
  }
}