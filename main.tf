provider "google" {
version = "3.5.0"
project = "mythic-tribute-352813"
region = "us-central1"
zone = "us-central1-c"
}

resource "google_storage_bucket" "default" {
  name          = "bucket-tfstatetf1"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

resource "google_container_cluster" "primary" {
  name               = "k8s"
  location           = "us-central1-a"
  initial_node_count = 3
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}

