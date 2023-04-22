output "networks" {
  value = aws_vpc.network.id
}
output "subnet" {
  value = aws_subnet.subnet_aws_eu.id
}
output "subnet_private" {
  value = aws_subnet.subnet_aws_eu_private.id
}