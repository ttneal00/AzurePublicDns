## Variables

variable "resource_group_name" {}

variable "cname_records" {
  type = list(object({
    key       = string
    cname_record = string
    zone      = string
    ttl       = number
    values    = string
  }))
}

## Resources

resource "azurerm_dns_cname_record" "cnames" {
  for_each = { for record in var.cname_records: record.key => record }
  name                = each.value.cname_record
  zone_name           = each.value.zone
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.values
}

## Outputs

output "name" {
    value = { 
        for key, record in azurerm_dns_cname_record.cnames: key => record.name}
}

output "zone_name" {
  value = { 
  for key, record in azurerm_dns_cname_record.cnames: key => record.zone_name}
}

output "resource_group_names" {
    value = { 
    for key, record in azurerm_dns_cname_record.cnames: key => record.resource_group_name
    }
}

output "ttls" {
    value = { 
    for key, record in azurerm_dns_cname_record.cnames: key => record.ttl
    }
}