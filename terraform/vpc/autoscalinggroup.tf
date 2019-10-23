resource "aws_autoscaling_group" "auto-scaling-group-1" {
  name                      = "auto-scaling-group-1"
  desired_capacity          = 1
  max_size                  = 2
  min_size                  = 1
  health_check_type         = "EC2"
  health_check_grace_period = 300
  vpc_zone_identifier       = ["${aws_subnet.public-subnet-3.id}", "${aws_subnet.public-subnet-2.id}"]
  launch_configuration      = "${aws_launch_configuration.launch-config-server1.name}"

  tags {
    key                 = "Name"
    value               = "ec2 Instance"
    propagate_at_launch = true
  }
}
