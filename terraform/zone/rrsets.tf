resource "aws_route53_zone" "main" {
  name              = var.zone.name
  delegation_set_id = var.delegation_set_id
}

resource "aws_route53_record" "main" {
  for_each = {
    for rrset in var.zone.rrsets :
    join(":", [rrset.name, rrset.type]) => {
      records : rrset.records,
      time : rrset.time
    }
  }


  records = [
    for record in each.value.records :
    length(record) > 255 ? join("\" \"", [
      for i in range(0, length(record), 255) :
      substr(record, i, min(255, length(record) - i))
    ]) : record
  ]

  zone_id = aws_route53_zone.main.id
  name    = split(":", each.key)[0]
  type    = split(":", each.key)[1]
  ttl     = each.value.time
}