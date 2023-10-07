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

  zone_id = aws_route53_zone.main.id
  records = each.value.records
  name    = split(":", each.key)[0]
  type    = split(":", each.key)[1]
  ttl     = each.value.time
}