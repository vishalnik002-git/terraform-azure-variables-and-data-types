variable "vm_profile" {
  type = object({
    sku      = string
    disk_gb  = number
    managed  = bool
  })
  default = {
    sku     = "Standard_B2s"
    disk_gb = 128
    managed = true
  }
}

variable "network_tuple" {
  type    = tuple([string, number, string])
  default = ["10.0.0.0/16", 443, "HTTPS"]
}
