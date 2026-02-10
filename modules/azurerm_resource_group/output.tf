# output "rg_ids" {
#   value = { for k, v in azurerm_resource_group.rgs : k => v.id }
# }
output "name" {
  value = azurerm_resource_group.rgs["rg1"].name
}

output "location" {
  value = azurerm_resource_group.rgs["rg1"].location
}
