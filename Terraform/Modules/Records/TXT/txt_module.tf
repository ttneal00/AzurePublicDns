## Variables

variable "resource_group_name" {}

variable "txt_records" {
  type = list(object({
    key       = string
    txtrecord = string
    zone      = string
    ttl       = number
    values    = list(string)
  }))
}

## Resources 

resource "azurerm_dns_txt_record" "txt_records" {
  for_each = { for idx, record in var.txt_records : idx => record }

  name                = each.value.txtrecord
  zone_name           = each.value.zone
  resource_group_name = var.resource_group_name
  ttl                 = 300

  dynamic "record" {
    for_each = each.value.values
    content {
      value = record.value
    }
  }
}

## Outputs

output "name" {
    value = { 
        for key, record in azurerm_dns_txt_record.txt_records: key => record.name}
}

output "zone_name" {
  value = { 
  for key, record in azurerm_dns_txt_record.txt_records: key => record.zone_name}
}

output "resource_group_names" {
    value = { 
    for key, record in azurerm_dns_txt_record.txt_records: key => record.resource_group_name
    }
}

output "ttls" {
    value = { 
    for key, record in azurerm_dns_txt_record.txt_records: key => record.ttl
    }
}