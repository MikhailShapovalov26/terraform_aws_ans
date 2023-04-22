resource "aws_vpc" "network" {
  cidr_block       = var.cidr_block_network
  enable_dns_support   = true
  enable_dns_hostnames = true
}
resource "aws_subnet" "subnet_aws_eu" {
  vpc_id            = aws_vpc.network.id
  cidr_block        = var.cidr_block_subnet_public
  availability_zone = var.aws_zone
  map_public_ip_on_launch = true
  tags = {
    "name" = "subnet"
  }
}
resource "aws_subnet" "subnet_aws_eu_private" {
  vpc_id            = aws_vpc.network.id
  cidr_block        = var.cidr_block_subnet_private
  availability_zone = var.aws_zone
  tags = {
    "name" = "subnet_private"
  }
}
resource "aws_internet_gateway" "gateway_aws_eu" {
  vpc_id = aws_vpc.network.id
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway_aws_eu.id
  }
}

resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.subnet_aws_eu.id
  route_table_id = aws_route_table.public_rt.id
}

