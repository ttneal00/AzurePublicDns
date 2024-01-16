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