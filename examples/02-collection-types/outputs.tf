output "collection_summary" {
  value = {
    primary_region = local.first_region
    production_tag = local.prod_env
  }
}
