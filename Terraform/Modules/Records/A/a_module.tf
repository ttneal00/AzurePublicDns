## Variables

variable "resource_group_name" {}

variable "host_records" {
  type = list(object({
    key       = string
    a_record = string
    zone      = string
    ttl       = number
    values    = list(string)
  }))
}

## Resources

resource "azurerm_dns_a_record" "arecords" {
  for_each = { for record in var.host_records: record.key => record }
  name                = each.value.a_record
  zone_name           = each.value.zone
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.values
}

## Output

output "name" {
    value = { 
        for key, record in azurerm_dns_a_record.arecords: key => record.name}
}

output "zone_name" {
  value = { 
  for key, record in azurerm_dns_a_record.arecords: key => record.zone_name}
}

output "resource_group_names" {
    value = { 
    for key, record in azurerm_dns_a_record.arecords: key => record.resource_group_name
    }
}

output "ttls" {
    value = { 
    for key, record in azurerm_dns_a_record.arecords: key => record.ttl
    }
}
