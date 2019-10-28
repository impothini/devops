resource "aws_key_pair" "mykey" {
  key_name   = "deployer-key"
  public_key = "${file("mykey.pub")}"
}
