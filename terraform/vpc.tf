resource "aws_vpc" "POI-VPC" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "POI-VPC"
  }
}

resource "aws_subnet" "POI-PUBLIC-SUBNET" {
  vpc_id                  = aws_vpc.POI-VPC.id
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "POI-PUBLIC-SUBNET"
  }
}

resource "aws_subnet" "POI-PRIVATE-SUBNET" {
  vpc_id                  = aws_vpc.POI-VPC.id
  cidr_block              = "192.168.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags = {
    Name = "POI-PRIVATE-SUBNET"
  }
}

resource "aws_internet_gateway" "POI-IGW" {
  vpc_id = aws_vpc.POI-VPC.id

  tags = {
    Name = "POI-IGW"
  }
}

resource "aws_route_table" "POI-RT" {
  vpc_id = aws_vpc.POI-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.POI-IGW.id
  }

  tags = {
    Name = "POI-RT"
  }
}

resource "aws_route_table_association" "POI-PUBLIC-1a" {
  subnet_id      = aws_subnet.POI-PUBLIC-SUBNET.id
  route_table_id = aws_route_table.POI-RT.id
}
