resource "azurerm_subnet" "subnets" {
  for_each = {
    for item in flatten([
      for vnet_key, vnet in var.networks : [
        for subnet in vnet.subnets : {
          key                  = "${vnet.name}-${subnet.name}"
          name                 = subnet.name
          address_prefixes     = subnet.address_prefixes
          resource_group_name  = vnet.resource_group_name
          virtual_network_name = vnet.name
        }
      ]
    ]) : item.key => item
  }

  name                 = each.value.name
  address_prefixes     = each.value.address_prefixes
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}
