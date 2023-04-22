# variable "aws_zone_" {
#   type = string
# }
# variable "ami_" {
#   type = string
# }
# variable "type_instance_" {
#   type = string
# }
variable "security_groups" {
    type = list(string) 
}
variable "key_name" {
    type = string
}
# variable "subnet_id" {
#   type = string
# }
variable "list_vm" {
  type = list(any)
}