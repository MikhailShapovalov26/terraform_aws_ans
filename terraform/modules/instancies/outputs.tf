output "private_ip" {
  value = aws_instance.append[0].private_ip
}
output "public_dns" {
  value = aws_instance.append[0].public_dns
}