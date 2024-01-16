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