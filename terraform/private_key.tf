resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "ec2_privatekey" {
  key_name   = "python"
  public_key = tls_private_key.private_key.public_key_openssh
  provisioner "local-exec" {
    command = <<-EOT
    echo '${tls_private_key.private_key.private_key_pem}' > ../ansible/python.pem
    echo '${tls_private_key.private_key.public_key_openssh}' > ../ansible/python.pub
    chmod 600 ../ansible/python.pem
    chmod 600 ../ansible/python.pub
    EOT    
  }
}
