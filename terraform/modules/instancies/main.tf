resource "aws_instance" "append" {
  for_each = { for key, value in var.list_vm : key => value }
  ami               = each.value.ami
  instance_type     = each.value.type_instance
  availability_zone = each.value.aws_zone
  key_name          = "${var.key_name}"
  associate_public_ip_address = true
  subnet_id = each.value.subnet
  root_block_device {
     volume_size = 15
     volume_type = "standard"
   }
  vpc_security_group_ids   = "${var.security_groups}"
  tags = {
    "name" = "VM-${each.key}"
  }
}


# resource "aws_instance" "append" {
#   count = var.vm_count
#   ami               = "${var.ami_}"
#   instance_type     = "${var.type_instance_}"
#   availability_zone = "${var.aws_zone_}"
#   key_name          = "${var.key_name}"
#   associate_public_ip_address = true
#   subnet_id = var.subnet_id
#   root_block_device {
#      volume_size = 15
#      volume_type = "standard"
#    }
#   vpc_security_group_ids   = "${var.security_groups}"
#   tags = {
#     "name" = "VM-${count.index}-AWS"
#   }
# }