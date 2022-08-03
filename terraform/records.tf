resource "aws_route53_record" "dev_mx" {
  zone_id = aws_route53_zone.dev.zone_id
  records = local.dev.records.mx
  name    = local.dev.name
  type    = "MX"
  ttl     = 3600
}

resource "aws_route53_record" "dev_txt" {
  zone_id = aws_route53_zone.dev.zone_id
  records = local.dev.records.txt
  name    = local.dev.name
  type    = "TXT"
  ttl     = 3600
}

resource "aws_route53_record" "io_mx" {
  zone_id = aws_route53_zone.io.zone_id
  records = local.io.records.mx
  name    = local.io.name
  type    = "MX"
  ttl     = 3600
}