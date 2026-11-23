output "complex_summary" {
  value = {
    vm      = local.vm_description
    network = local.network_summary
  }
}
