output "subnet_ids" {
  description = "Map of subnet name to subnet id"
  value = {
    for _, subnet in azurerm_subnet.subnets :
    subnet.name => subnet.id
  }
}
