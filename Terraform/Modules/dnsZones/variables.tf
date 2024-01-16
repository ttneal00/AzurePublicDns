variable resource_group_name {}

variable "dnszones" {
  type = list(object({
    key       = string
    name      = string
  }))
}