resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "ec2_privatekey" {
  key_name   = "python"
  public_key = tls_private_key.private_key.public_key_openssh
  provisioner "local-exec" {
    command = <<-EOT
    echo '${tls_private_key.private_key.private_key_pem}' > ./testkey.pem
    echo '${tls_private_key.private_key.public_key_openssh}' > ./testpub.pub
    chmod 600 ./testkey.pem
    chmod 600 ./testpub.pub
    EOT    
  }
}
