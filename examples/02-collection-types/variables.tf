variable "regions_list" {
  type    = list(string)
  default = ["eastus", "westus", "centralus"]
}

variable "roles_set" {
  type    = set(string)
  default = ["web", "api", "worker"]
}

variable "env_map" {
  type = map(string)
  default = {
    dev  = "Development"
    prod = "Production"
  }
}
