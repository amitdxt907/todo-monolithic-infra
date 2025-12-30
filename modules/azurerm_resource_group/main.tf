resource "azurerm_resource_group" "rgs" {
  for_each   = var.rgs # for_each ya to set leta hai ya MAP leta hai
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
  tags       = each.value.tags
}
