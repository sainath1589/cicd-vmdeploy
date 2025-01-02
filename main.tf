provider "google" {
  project     = "future-lane-444809-c3"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = var.gcp_credentials
}

variable "gcp_credentials" {
  type        = string
  description = "GCP Service Account JSON Key"
}


