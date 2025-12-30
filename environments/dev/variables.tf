variable "rgs" {
  type = map(object({
    name       = string
    location   = string
  }))
}

variable "networks" {}
variable "public_ips" {}
variable "key_vaults" {}
variable "vms" {}