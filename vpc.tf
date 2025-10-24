# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"     # <your-cidr-block>
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tf-lab-vpc"
  }
}

# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"  # <your-public-cidr>
  availability_zone       = "us-east-1a"   # <your-az>
  map_public_ip_on_launch = true

  tags = {
    Name = "tf-public-subnet"
    Tier = "public"
  }
}

# Private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"  # <your-private-cidr>
  availability_zone = "us-east-1b"   # <your-az>

  tags = {
    Name = "tf-private-subnet"
    Tier = "private"
  }
}
