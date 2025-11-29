# Simple Terraform configuration
# This creates a local text file

terraform {
  required_version = ">= 1.0"
}

resource "local_file" "welcome" {
  filename = "${path.module}/welcome.txt"
  content  = "Hello from Terraform CI/CD! This pipeline runs automatically on every push!"
}

output "file_path" {
  value       = local_file.welcome.filename
  description = "Path to the created file"
}

output "file_content" {
  value       = local_file.welcome.content
  description = "Content of the file"
}
