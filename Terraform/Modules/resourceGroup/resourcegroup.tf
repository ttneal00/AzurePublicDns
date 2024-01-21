## Variables

variable "location" {}

variable "DnsResourceGroup" {}

variable "tags" {}

## Resources

resource "azurerm_resource_group" "public_dns_zone" {
  name     = var.DnsResourceGroup
  location = var.location
  tags     = var.tags
}

## Outputs

output "name" {
  value = azurerm_resource_group.public_dns_zone.name
}

output "id" {
  value = azurerm_resource_group.public_dns_zone.id
}

output "location" {
  value = azurerm_resource_group.public_dns_zone.location
}

output "tags" {
  value = azurerm_resource_group.public_dns_zone.tags
}