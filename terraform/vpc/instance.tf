resource "aws_instance" "server1" {
  ami             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.mykey.key_name}"
  subnet_id       = "${aws_subnet.public-subnet-1.id}"
  security_groups = ["${aws_security_group.allow-ssh.id}"]

  tags {
    name = "server1"
  }
}
