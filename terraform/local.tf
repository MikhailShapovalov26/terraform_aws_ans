locals {
  aws_zone           = "eu-west-3a"
  cidr_block_network = "10.10.0.0/16"
  cidr_block_subnet_pub  = "10.10.10.0/24"
  cidr_block_subnet_priv  = "10.10.5.0/24"
  ami                = "ami-0941291d62876ec7c"
  type_instance      = "t2.micro"

  public_subnets  = module.network.subnet
  private_subnets = module.network.subnet_private

  public_instance_conf = [ 
    {
    ami = "ami-0941291d62876ec7c"
    type_instance      = "t2.micro"
    aws_zone           = "eu-west-3a"
    subnet = local.public_subnets
  },
  {
    ami = "ami-0941291d62876ec7c"
    type_instance      = "t2.micro"
    aws_zone           = "eu-west-3a"
    subnet = local.public_subnets
  }
  ]
  
  private_instance_conf = [
    {
    ami = "ami-0941291d62876ec7c"
    type_instance      = "t2.micro"
    aws_zone           = "eu-west-3a"
    subnet = local.private_subnets
  }
  ]
}