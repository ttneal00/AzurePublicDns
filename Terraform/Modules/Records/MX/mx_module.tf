## Variables

variable "resource_group_name" {
  type = string
}

variable "mx_records" {
  type = list(object({
    key         = string
    mxrecord    = string
    zone        = string
    ttl         = number
    preferences = list(number)
    values      = list(string)
  }))
}

## Resources

resource "azurerm_dns_mx_record" "mx_record" {
  for_each = { for record in var.mx_records :
    record.key => record
  }

  name                = each.value.mxrecord
  zone_name           = each.value.zone
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl

  dynamic "record" {
    for_each = [for i in range(length(each.value.preferences)) : {
      preference = each.value.preferences[i]
      value      = each.value.values[i]
    }]

    content {
      preference = record.value.preference
      exchange   = record.value.value
    }
  }
}

## Outputs

output "name" {
    value = { 
        for key, record in azurerm_dns_mx_record.mx_record: key => record.name}
}

output "zone_name" {
  value = { 
  for key, record in azurerm_dns_mx_record.mx_record: key => record.zone_name}
}

output "resource_group_names" {
    value = { 
    for key, record in azurerm_dns_mx_record.mx_record: key => record.resource_group_name
    }
}

output "ttls" {
    value = { 
    for key, record in azurerm_dns_mx_record.mx_record: key => record.ttl
    }
}