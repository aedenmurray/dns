terraform {
  cloud {
    organization = "aedenmurray"

    workspaces {
      name = "dns"
    }
  }
}

locals {
  dev = yamldecode(file("../config/aedenmurray.dev.yaml"))
  io  = yamldecode(file("../config/aedenmurray.io.yaml"))
}