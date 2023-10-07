variable "zone" {
  type = object({
    name = string
    rrsets = list(
      object({
        type    = string
        name    = string
        time    = number
        records = list(string)
      })
    )
  })
}

variable "delegation_set_id" {
  type = string
}