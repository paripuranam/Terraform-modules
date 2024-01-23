provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "stage_vpc" {
  cidr_block = "13.0.0.0/16"

  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = {
    Name = "terra-stage-vpc"
  }
}

resource "aws_internet_gateway" "stage_ig" {
  vpc_id = aws_vpc.stage_vpc.id
  tags = {
    Name="terra-stage-internet-gateway"
  }
}

resource "aws_route_table" "stage_pub_rt_table" {
  vpc_id = aws_vpc.stage_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.stage_ig.id
  }
}

resource "aws_route_table_association" "stage_pub_rt_table_ass" {
  subnet_id = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.stage_pub_rt_table.id
}

resource "aws_subnet" "subnet_1" {
  cidr_block = "13.0.0.0/24"
  vpc_id     = aws_vpc.stage_vpc.id

  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "terra-stage-subnet-1"
  }
}

resource "aws_security_group" "stage_security_group" {
  vpc_id = aws_vpc.stage_vpc.id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port=0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}