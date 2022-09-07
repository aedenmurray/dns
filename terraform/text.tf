resource "aws_route53_record" "dev_txt" {
  zone_id = aws_route53_zone.dev.zone_id
  records = local.dev.records.txt
  name    = local.dev.name
  type    = "TXT"
  ttl     = 3600
}

resource "aws_route53_record" "io_txt" {
  zone_id = aws_route53_zone.io.zone_id
  records = local.io.records.txt
  name    = local.io.name
  type    = "TXT"
  ttl     = 3600
}