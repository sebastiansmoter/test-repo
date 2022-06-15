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
  source_image = "centos-stream-8-v20220519"
  zone         = "us-central1-a"
  ssh_username = "jenkins-service-account"
  startup_script_file = "start.sh"
}

build {
  sources = ["sources.googlecompute.basic-example"]
  
    provisioner "shell" {
    inline = [
      "sudo dnf install nginx --assumeyes",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "sudo firewall-cmd --permanent --add-service=http",
      "sudo firewall-cmd --permanent --list-all",
      "sudo firewall-cmd --reload"
    ]
  }
 }







