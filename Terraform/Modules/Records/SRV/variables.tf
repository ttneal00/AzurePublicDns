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