resource "aws_autoscaling_group" "frontend-ASG-tf" {
  name                 = "frontend-asg"
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  force_delete         = true
  depends_on           = [aws_lb.frontend-lb]
  target_group_arns    = ["${aws_lb_target_group.frontend-tg.arn}"]
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.frontend-launch-config.name
  vpc_zone_identifier  = ["${aws_subnet.prv_sub1.id}", "${aws_subnet.prv_sub2.id}"]

  tag {
    key                 = "Name"
    value               = "frontend-exchange"
    propagate_at_launch = true
  }
}