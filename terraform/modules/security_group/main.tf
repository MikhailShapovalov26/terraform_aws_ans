resource "aws_security_group" "security" {
  name   = "security"
  vpc_id = var.vpc_id
}
resource "aws_security_group_rule" "public_in_ssh" {
  type              = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.security.id
}
resource "aws_security_group_rule" "private_icmp" {
  type        = "ingress"
  from_port   = -1
  to_port     = -1
  protocol    = "icmp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.security.id
}
resource "aws_security_group_rule" "private_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.security.id
}
resource "aws_security_group_rule" "apache_kafka" {
  type = "ingress"
  from_port = 9092
  to_port = 9092
  protocol = "TCP"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.security.id
}
resource "aws_security_group_rule" "allow_apache_zookeeper" {
  type = "ingress"
  from_port = 2181
  to_port = 2181
  protocol = "tcp"
  cidr_blocks = ["10.10.10.0/24"]
  security_group_id = aws_security_group.security.id
}
resource "aws_security_group_rule" "allow_apache_zookeeper_network" {
  type = "ingress"
  from_port = 3888
  to_port = 3888
  protocol = "tcp"
  cidr_blocks = ["10.10.10.0/24"]
  security_group_id = aws_security_group.security.id
}
resource "aws_security_group_rule" "public_in_http" {
  type              = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.security.id
}
resource "aws_security_group_rule" "public_in_https" {
  type              = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
  security_group_id = aws_security_group.security.id
}


















# resource "aws_security_group" "ssh_security" {
#   name   = "ssh"
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
# resource "aws_security_group" "http_security" {
#   name   = "http"
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
