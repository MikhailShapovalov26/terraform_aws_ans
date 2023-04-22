module "network" {
  source             = "./modules/networks"
  cidr_block_network = local.cidr_block_network
  cidr_block_subnet_public  = local.cidr_block_subnet_pub
  cidr_block_subnet_private  = local.cidr_block_subnet_priv
  aws_zone           = local.aws_zone
}
module "security_groups" {
  source = "./modules/security_group"
  vpc_id = module.network.networks
}
# module "aws_instance" {
#   vm_count        = 2
#   source          = "./modules/instancies"
#   aws_zone_       = local.aws_zone
#   subnet_id       = module.network.subnet
#   type_instance_  = local.type_instance
#   ami_            = local.ami
#   security_groups = [module.security_groups.security_group]
#   key_name        = aws_key_pair.ec2_privatekey.key_name
# }

module "aws_instance" {
  source          = "./modules/instancies"
  list_vm = local.public_instance_conf 
  security_groups = [module.security_groups.security_group]
  key_name        = aws_key_pair.ec2_privatekey.key_name
}

# module "aws_instance_2" {
#   source          = "./modules/instancies"
#   list_vm = local.private_instance_conf
#   security_groups = [module.security_groups.security_group]
#   key_name        = aws_key_pair.ec2_privatekey.key_name
# }