resource "azurerm_dns_txt_record" "txt_record" {
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