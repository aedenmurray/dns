terraform {
  cloud {
    organization = "aedenmurray"

    workspaces {
      name = "dns"
    }
  }
}

locals {
  dev = yamldecode(file("../records/aedenmurray.dev.yaml"))
  io  = yamldecode(file("../records/aedenmurray.io.yaml"))
}