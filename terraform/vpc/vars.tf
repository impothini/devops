variable "AWS_REGION" {
  default = "us-east-2"
}

variable "AMIS" {
  type = "map"

  default = {
    "us-east-1" = "ami-04763b3055de4860b"
    "us-west-1" = "ami-0dbf5ea29a7fc7e05"
    "us-east-2" = "ami-0d03add87774b12c5"
  }
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}
