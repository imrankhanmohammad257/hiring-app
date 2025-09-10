resource "local_file" "my_pet" {
  content  = var.content
  filename = "/home/ec2-user/hiring_app/${var.filename}"  # absolute path
  file_permission      = "0777"
  directory_permission = "0777"
}
