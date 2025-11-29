terraform {
  required_version = ">= 1.0"
}

resource "local_file" "live_test" {
  filename = "${path.module}/live-test.txt"
  content  = "🚀 LIVE CI/CD TEST - Pushed at: ${timestamp()}\n👤 User: vikash raj\n💻 From: MacBook"
}

resource "local_file" "proof" {
  filename = "${path.module}/proof.txt"
  content  = <<-EOT
    ============================================
    ✅ CI/CD PIPELINE VERIFICATION
    ============================================
    
    This file was created by GitHub Actions
    running on GitHub's cloud server.
    
    NOT created on your MacBook!
    Created on: Ubuntu server (GitHub Actions)
    
    If you see this in the workflow logs,
    your CI/CD pipeline is working perfectly!
    ============================================
  EOT
}

output "test_result" {
  value = "✅ CI/CD Pipeline Working!"
}
