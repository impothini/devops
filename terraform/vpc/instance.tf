resource "aws_instance" "server1" {
  ami             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.mykey.key_name}"
  subnet_id       = "${aws_subnet.public-subnet-1.id}"
  security_groups = ["${aws_security_group.allow-ssh.id}"]
  user_data       = "${data.template_cloudinit_config.cloudinit-example.rendered}"

  tags {
    name = "server1"
  }
}

#Add extra ebs volume
resource "aws_ebs_volume" "extra-volume-1" {
  availability_zone = "us-east-2b"
  size              = 20
  type              = "gp2"

  tags {
    Name = "extra-volume-1"
  }
}

resource "aws_volume_attachment" "ebs-att-1" {
  device_name = "${vars.INSTANCE_DEVICE_NAME}"
  volume_id   = "${aws_ebs_volume.extra-volume-1.id}"
  instance_id = "${aws_instance.server1.id}"
}
