 resource "local_file" "ansible_inventory" {
  content =  <<-DOC
  ---
    targets:
       hosts:
         ${aws_instance.bucket_python.private_ip}:
            ansible_connection: ssh
            ansible_host: ${aws_instance.bucket_python.public_dns}
            ansible_user: ubuntu
            ansible_private_key_file: ./python.pem
    DOC
  filename = "../ansible/inventory.yml"
}