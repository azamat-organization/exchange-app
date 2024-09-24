resource "aws_autoscaling_group" "backend-ASG-tf" {
  name                 = "backend-asg"
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  force_delete         = true
  depends_on           = [aws_lb.backend-lb]
  target_group_arns    = ["${aws_lb_target_group.backend-tg.arn}"]
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.backend-launch-config.name
  vpc_zone_identifier  = ["${aws_subnet.prv_sub1.id}", "${aws_subnet.prv_sub2.id}"]

  tag {
    key                 = "Name"
    value               = "backend-exchange"
    propagate_at_launch = true
  }
}