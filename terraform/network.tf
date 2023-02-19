resource "aws_vpc" "network" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
     tags = {
         Name = "main"
            }
}

resource "aws_subnet" "subnet_aws_eu" {
  vpc_id            = aws_vpc.network.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-3a"
  map_public_ip_on_launch = true
  tags = {
    "name" = "subnet"
  }
}
resource "aws_internet_gateway" "gateway_aws_eu" {
  vpc_id = aws_vpc.network.id
}
