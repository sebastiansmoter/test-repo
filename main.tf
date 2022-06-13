provider "google" {
version = "3.5.0"
credentials = 
project = "mythic-tribute-352813"
region = "us-central1"
zone = "us-central1-c"
}

resource "google_container_cluster" "primary" {
  name               = "k8s"
  location           = "us-central1-a"
  initial_node_count = 3
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = jenkins-service-account@mythic-tribute-352813.iam.gserviceaccount.com
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
