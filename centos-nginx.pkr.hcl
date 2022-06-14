packer {
  required_plugins {
    googlecompute = {
      version = ">= 0.0.1"
      source = "github.com/hashicorp/googlecompute"
    }
  }
}

source "googlecompute" "ubuntu" {
  image  = "ubuntu:xenial"
  commit = true
}

build {
  name    = "learn-packer"
  sources = [
    "source.googlecompute.ubuntu"
  ]
}
