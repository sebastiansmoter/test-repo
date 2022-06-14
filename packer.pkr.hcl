packer {
  required_plugins {
    googlecompute = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

source "googlecompute" "basic-example" {
  project_id   = "mythic-tribute-352813"
  source_image = "debian-9-stretch-v20200805"
  zone         = "us-central1-a"
  ssh_username = "jenkins-service-account"
}

build {
  sources = ["sources.googlecompute.basic-example"]
}
