# ==========================================
# 1. Primitive Data Types
# ==========================================
variable "project_name" {
  type        = string
  description = "A string variable representing project name."
  default     = "cloud-platform"
}

variable "instance_count" {
  type        = number
  description = "A number variable representing the replica count."
  default     = 2
}

variable "enable_geo_replication" {
  type        = bool
  description = "A boolean variable for toggling features."
  default     = false
}

# ==========================================
# 2. Collection Data Types
# ==========================================
variable "allowed_regions" {
  type        = list(string)
  description = "An ordered sequence of strings."
  default     = ["eastus", "centralus", "westus"]
}

variable "unique_environment_tags" {
  type        = set(string)
  description = "A collection of unique string values."
  default     = ["dev", "stage", "prod"]
}

variable "resource_tags" {
  type        = map(string)
  description = "A map of key-value pairs representing tags."
  default = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}

# ==========================================
# 3. Complex Data Types
# ==========================================
variable "storage_profile" {
  type = object({
    name         = string
    tier         = string
    replication  = string
  })
  description = "An object grouping named typed attributes."
  default = {
    name        = "stvardata01"
    tier        = "Standard"
    replication = "LRS"
  }
}

variable "server_spec" {
  type        = tuple([string, number, bool])
  description = "A fixed sequence of specific types (string, number, bool)."
  default     = ["Standard_B2s", 2, true]
}

# ==========================================
# 4. Azure Target Variables
# ==========================================
variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
  default     = "rg-variables-demo"
}

variable "location" {
  type        = string
  description = "Primary Azure region"
  default     = "eastus"
}
