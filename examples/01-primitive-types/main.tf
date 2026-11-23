# Local pure-Terraform demonstration of primitive types
locals {
  summary = "Env: ${var.environment_name}, Replicas: ${var.replica_count}, Active: ${var.is_active}"
}
