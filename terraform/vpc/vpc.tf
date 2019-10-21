#Main VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name = "terraform_vpc"
  }
}

#Public Subnets

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = "${aws_vpc.terraform_vpc.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  tags {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = "${aws_vpc.terraform_vpc.id}"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"

  tags {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id                  = "${aws_vpc.terraform_vpc.id}"
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"

  tags {
    Name = "public-subnet-3"
  }
}

#Private Subnets

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = "${aws_vpc.terraform_vpc.id}"
  cidr_block = "10.0.4.0/24"

  tags {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id     = "${aws_vpc.terraform_vpc.id}"
  cidr_block = "10.0.5.0/24"

  tags {
    Name = "private-subnet-2"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id     = "${aws_vpc.terraform_vpc.id}"
  cidr_block = "10.0.6.0/24"

  tags {
    Name = "private-subnet-3"
  }
}

#Internet Gateway

resource "aws_internet_gateway" "gateway-1" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"

  tags {
    name = "gateway-1"
  }
}

#Routing table
resource "aws_route_table" "puble-route-table-1" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gateway-1.id}"
  }

  tags {
    name = "puble-route-table-1"
  }
}

#Route table association

resource "aws_route_table_association" "public-subnet-1-a" {
  subnet_id      = "${aws_subnet.public-subnet-1.id}"
  route_table_id = "${aws_route_table.puble-route-table-1.id}"
}

resource "aws_route_table_association" "public-subnet-2-a" {
  subnet_id      = "${aws_subnet.public-subnet-2.id}"
  route_table_id = "${aws_route_table.puble-route-table-1.id}"
}

resource "aws_route_table_association" "public-subnet-3-a" {
  subnet_id      = "${aws_subnet.public-subnet-3.id}"
  route_table_id = "${aws_route_table.puble-route-table-1.id}"
}
