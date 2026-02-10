variable "subnet_ids" {
  type = map(string)
}

variable "public_ip_ids" {
  type = map(string)
}

variable "vms" {
  type = map(object({
    vm_name     = string
    rg_name     = string
    location    = string
    size        = string
    nic_name    = string
    subnet_name = string
    pip_name    = string
    admin_username = string
    admin_password = string
    tags = map(string)
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
