variable "environment_name" {
  type    = string
  default = "staging"
}

variable "replica_count" {
  type    = number
  default = 3
}

variable "is_active" {
  type    = bool
  default = true
}
