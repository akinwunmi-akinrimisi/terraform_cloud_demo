provider "aws" {
  region = eu-west-2
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = default
  tags = {
    "name" = "vpc_akin"
  }

}

resource "aws_subnet" "cba_public_01" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-2a"
  tags = {
    Name = "ApachePublicSubnet_01"
  }
}