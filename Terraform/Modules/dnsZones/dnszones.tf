resource "azurerm_dns_zone" "zones" {
  for_each = { for idx, record in var.dnszones : idx => record }
  name                = each.value.name
  resource_group_name = var.resource_group_name
}

output "ids" {
  value = { for key, zone in azurerm_dns_zone.zones : key => zone.id }
}

output "all_zone_names" {
  value = { for key, zone in azurerm_dns_zone.zones : key => zone.name }
}