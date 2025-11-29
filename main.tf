# Simple Terraform configuration
# This creates a local text file

terraform {
  required_version = ">= 1.0"
}

resource "local_file" "welcome" {
  filename = "${path.module}/welcome.txt"
  content  = "Hello from Terraform! This file was created by Infrastructure as Code."
}

output "file_path" {
  value       = local_file.welcome.filename
  description = "Path to the created file"
}
