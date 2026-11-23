output "primitive_string" {
  description = "Demonstration of string output."
  value       = var.project_name
}

output "primitive_number" {
  description = "Demonstration of number output."
  value       = var.instance_count
}

output "primitive_bool" {
  description = "Demonstration of boolean output."
  value       = var.enable_geo_replication
}

output "collection_list_first" {
  description = "Accessing list element by index."
  value       = var.allowed_regions[0]
}

output "collection_map_env" {
  description = "Accessing map value by key."
  value       = var.resource_tags["Environment"]
}

output "complex_object_name" {
  description = "Accessing object attribute."
  value       = var.storage_profile.name
}

output "complex_tuple_spec" {
  description = "Accessing tuple elements."
  value       = "SKU: ${var.server_spec[0]}, Cores: ${var.server_spec[1]}"
}

output "resource_group_id" {
  description = "ID of the deployed Resource Group."
  value       = azurerm_resource_group.rg.id
}
