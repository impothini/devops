
resource "aws_instance" "testbuild" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  provisioner "local-exec" {
 	command ="echo ${aws_instance.testbuild.private_ip} >> private_ips.txt"
  }
  tags = {
    Name = "HelloWorld"
  }
}
  output "public_ip" {
	value = "${aws_instance.testbuild.public_ip}"
  }
