resource "aws_instance" "bucket_python" {
    ami = "ami-0941291d62876ec7c"
    instance_type = "t2.micro"
    availability_zone = "eu-west-3a"
    key_name = "python"
    monitoring = true
    # subnet_id = aws_subnet.subnet_aws_eu.id
    security_groups = [aws_security_group.ssh_security.name, aws_security_group.http_security.name]
    tags = {
      "name" = "python-bucket"
    }
    connection {
      type = "ssh"
      user = "python"
      host = aws_instance.bucket_python.public_ip
      private_key = file("testkey.pem")
      port = 22
      timeout = "3m"
    }
    # user_data = "${file("script.sh")}"
}