variable "availability_zone" {
  description = "availability zone used for the demo, based on region"
  default = {
    us-east-1   = "us-east-1a"
    us-east-1-p = "us-east-1b"
  }
}

variable "vpc_name" {
  default = "VPC using terraform"
}

variable "vpc_region" {
  default = "us-east-1"
}

variable "vpc_region_private" {
  default = "us-east-1-p"
}

variable "vpc_cidr_block" {
  default = "40.10.0.0/16"
}

variable "vpc_public_subnet_cidr" {
  default = "40.10.10.0/24"
}

variable "vpc_private_subnet_cidr" {
  default = "40.10.20.0/24"
}
