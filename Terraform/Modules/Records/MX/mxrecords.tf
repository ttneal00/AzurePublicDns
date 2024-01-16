resource "azurerm_dns_mx_record" "mxrecord" {
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