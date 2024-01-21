## Vars

variable "location" {
  default = "centralus"
}

variable "department" {
  default = "ci"
}

variable "environment" {
  default = "pr"
}

variable "subscription_id" {
  default = "635a2a50-5b7c-4391-adc5-468d76cd1ce3"
}


## Locals

data "external" "me" {
  program = ["az", "account", "show", "--query", "user"]
}

locals {
  dns_resource_group_name = "my-publicdns-temp"
  Owner                   = lookup(data.external.me.result, "name")
  localuser               = split("@", local.Owner)
  tags = {
    Environment  = var.environment
    Createdby    = lookup(data.external.me.result, "name")
    CreationDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}