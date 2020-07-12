
provider "aws" {
  region = "us-east-1" 
}

resource "aws_vpc" "test" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

}

resource "aws_subnet" "public_sn" {
  vpc_id = aws_vpc.test.id
  cidr_block = var.vpc_public_subnet_cidr
  map_public_ip_on_launch = "true"
  availability_zone = lookup(var.availability_zone, var.vpc_region)
}

resource "aws_subnet" "private_sn" {
  vpc_id = aws_vpc.test.id
  cidr_block = var.vpc_private_subnet_cidr
  availability_zone = lookup(var.availability_zone, var.vpc_region_private)
}


resource "aws_internet_gateway" "test_ig" {
  vpc_id = aws_vpc.test.id
}


resource "aws_route_table" "vpc_public_sn_rt" {
  vpc_id = aws_vpc.test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_ig.id
  }
}


resource "aws_route_table_association" "vpc_public_sn_rt_assn" {
  subnet_id      = aws_subnet.public_sn.id
  route_table_id = aws_route_table.vpc_public_sn_rt.id
}


resource "aws_security_group" "vpc_public_sg" {
  name        = "demo_pubic_sg"
  description = "demo public access security group"
  vpc_id      = aws_vpc.test.id


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
   from_port    = 22
   to_port      = 22
   protocol     = "tcp"
   cidr_blocks  = ["0.0.0.0/0"]
 }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "vpc_private_sg" {
  name        = "demo_private_sg"
  description = "demo security group to access private ports"
  vpc_id      = aws_vpc.test.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.vpc_public_subnet_cidr]
  }
}
