resource "aws_vpc" "network" {
    cidr_block       = "192.168.8.0/24"
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true
     tags = {
         Name = "main"
            }
}

resource "aws_subnet" "subnet_aws_eu" {
  vpc_id            = aws_vpc.network.id
  cidr_block        = aws_vpc.network.cidr_block
  availability_zone = "eu-west-3a"
  tags = {
    "name" = "subnet"
  }
}
# resource "aws_internet_gateway" "gateway_aws_eu" {
#   vpc_id = aws_vpc.network.id
# }
