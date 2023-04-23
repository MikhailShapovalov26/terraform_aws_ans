 resource "local_file" "ansible_inventory" {
  content =  <<-DOC
  ---
    targets:
       hosts:
        ${module.aws_instance.private_ip}:
            ansible_connection: ssh
            ansible_host: ${module.aws_instance.public_dns}
            ansible_user: ubuntu
            ansible_private_key_file: ./python.pem
    DOC
  filename = "../ansible/inventory.yml"
}