# Specify the provider
provider "google" {
  project     = "future-lane-444809-c3" # Replace with your GCP project ID
  region      = "us-central1"           # Replace with your preferred region
  zone        = "us-central1-a"         # Replace with your preferred zone
  credentials = var.gcp_credentials
}

# Variable for GCP credentials
variable "gcp_credentials" {
  type        = string
  default     = null
  description = "Service account key in JSON format"
}

# Resource to create a Compute Instance
resource "google_compute_instance" "example" {
  name         = "example-vm"
  machine_type = "e2-micro" # Change as per your requirement
  zone         = "us-central1-a" # Replace with your preferred zone

  # Boot disk configuration
  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts" # Ubuntu 20.04 LTS image
    }
  }

  # Network configuration
  network_interface {
    network = "default" # Reference the default network

    access_config {
      # Ephemeral public IP (automatically assigned by GCP)
    }
  }
}

