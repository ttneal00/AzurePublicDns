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
  default = "SUBSCRIPTION_ID_HERE"
}


## Locals

data "external" "me" {
  program = ["az", "account", "show", "--query", "user"]
}

locals {
  dns_resource_group_name = "my-publicdns-lab"
  Owner                   = lookup(data.external.me.result, "name")
  localuser               = split("@", local.Owner)
  tags = {
    Environment  = var.environment
    Createdby    = lookup(data.external.me.result, "name")
    CreationDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}
