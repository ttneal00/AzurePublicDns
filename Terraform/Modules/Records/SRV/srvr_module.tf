## Variables

variable "resource_group_name" {
  type = string
}

variable "srv_records" {
  type = list(object({
    key       = string
    srvrecord = string
    zone      = string
    ttl       = number
    values    = list(string)
    priority  = list(string)
    weight    = list(string)
    ports     = list(string)

  }))
}

## Resources

resource "azurerm_dns_srv_record" "srvrecords" {
  for_each = { for record in var.srv_records :
    record.key => record
  }

  name                = each.value.srvrecord
  zone_name           = each.value.zone
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl

  dynamic "record" {
    for_each = [for i in range(length(each.value.values)) : {
      priority = each.value.priority[i]
      weight   = each.value.weight[i]
      target   = each.value.values[i]
      ports    = each.value.ports[i]
    }]

    content {
      priority = record.value.priority
      weight   = record.value.weight
      target   = record.value.target
      port     = record.value.ports
    }
  }
}

## Outputs

output "name" {
  value = azurerm_dns_srv_record.srvrecords
}

output "zone_name" {
  value = azurerm_dns_srv_record.srvrecords
}

output "resource_group_name" {
  value = azurerm_dns_srv_record.srvrecords
}

output "ttl" {
  value = azurerm_dns_srv_record.srvrecords
}