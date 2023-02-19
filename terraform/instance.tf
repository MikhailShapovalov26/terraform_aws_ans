resource "aws_instance" "bucket_python" {
  ami               = "ami-0941291d62876ec7c"
  instance_type     = "t2.micro"
  availability_zone = "eu-west-3a"
  key_name          = "${aws_key_pair.ec2_privatekey.key_name}"
  root_block_device {
     volume_size = 15
     volume_type = "standard"
   }
  security_groups   = [  "${aws_security_group.ssh_security.name}", "${aws_security_group.http_security.name}" ]
  tags = {
    "name" = "python-bucket"
  }
}