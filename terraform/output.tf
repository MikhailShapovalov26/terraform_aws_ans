# output "public_ip" {
#   value = aws_instance.bucket_python.public_ip
# }

# output "private_dns" {
#   description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
#   value       = try(aws_instance.bucket_python.private_dns, "")
# }

# output "public_dns" {
#   description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
#   value       = try(aws_instance.bucket_python.public_dns, "")
# }
# output "name" {
#   value = aws_instance.bucket_python.private_ip
# }
