terraform {
 backend "gcs" {
   bucket  = "bucket-tfstatetf"
   prefix  = "terraform/state"
 }
}
