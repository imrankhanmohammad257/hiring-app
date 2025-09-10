resource "local_file" "my_pet" {
  content  = var.content
  filename = "/var/lib/jenkins/workspace/terraform-maven/${var.filename}"
  file_permission      = "0777"
  directory_permission = "0777"
}
