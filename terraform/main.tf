terraform {
  cloud {
    organization = "aedenmurray"

    workspaces {
      name = "dns"
    }
  }
}

resource "aws_route53_delegation_set" "main" {
  reference_name = "aedenmurray"
}

module "aedenmurray_io" {
  source = "./zone"
  zone   = yamldecode(file("../zones/aedenmurray.io.yaml"))

  delegation_set_id = aws_route53_delegation_set.main.id
}

module "aedenmurray_dev" {
  source = "./zone"
  zone   = yamldecode(file("../zones/aedenmurray.dev.yaml"))

  delegation_set_id = aws_route53_delegation_set.main.id
}
