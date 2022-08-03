resource "aws_route53_delegation_set" "main" {
  reference_name = "aedenmurray"
}

resource "aws_route53_zone" "dev" {
  name              = local.dev.name
  delegation_set_id = aws_route53_delegation_set.main.id
}

resource "aws_route53_zone" "io" {
  name              = local.io.name
  delegation_set_id = aws_route53_delegation_set.main.id
}