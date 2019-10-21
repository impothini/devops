resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = "${aws_vpc.terraform_vpc.id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "-1"
    cidr_blocks = ["99.166.69.161/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    name = "allow-ssh"
  }
}
