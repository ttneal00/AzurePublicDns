resource "azurerm_dns_a_record" "arecords" {
  name                = var.record
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = var.ttl
  records             = var.values
}

output "name" {
  value = azurerm_dns_a_record.arecords.name
}

output "zone_name" {
  value = azurerm_dns_a_record.arecords.name
}

output "resource_group_name" {
  value = azurerm_dns_a_record.arecords.resource_group_name
}

output "ttl" {
  value = azurerm_dns_a_record.arecords.ttl
}