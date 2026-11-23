locals {
  vm_description  = "SKU ${var.vm_profile.sku} with ${var.vm_profile.disk_gb}GB disk"
  network_summary = "CIDR ${var.network_tuple[0]} over port ${var.network_tuple[1]}"
}
