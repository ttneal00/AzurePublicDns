resource "azurerm_dns_cname_record" "cnames" {
  name                = var.record
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = var.ttl
  record              = var.values
}

output "name" {
  value = azurerm_dns_cname_record.cnames.name
}

output "zone_name" {
  value = azurerm_dns_cname_record.cnames.zone_name
}

output "resource_group_name" {
  value = azurerm_dns_cname_record.cnames.resource_group_name
}

output "ttl" {
  value = azurerm_dns_cname_record.cnames.ttl
}