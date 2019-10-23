resource "aws_launch_configuration" "launch-config-server1" {
  name            = "launch-config-server1"
  image_id        = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.allow-ssh.id}"]
  user_data       = "${data.template_cloudinit_config.cloudinit-example.rendered}"
}
