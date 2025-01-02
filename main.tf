# Specify the provider for Google Cloud
provider "google" {
  project     = "future-lane-444809-c3"  # Your GCP project ID
  region      = "us-central1"            # Your preferred region
  zone        = "us-central1-a"          # Your preferred zone
  credentials = var.gcp_credentials      # Service account credentials passed from GitHub Secrets
}

# Define the variable for GCP credentials
variable "gcp_credentials" {
  type        = string
  description = "Service account key in JSON format"
}

# Google Compute Engine instance resource
resource "google_compute_instance" "example" {
  name         = "example-vm"  # VM name
  machine_type = "e2-micro"    # Machine type
  zone         = "us-central1-a" # Zone

  # Define boot disk and use an Ubuntu image
  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"  # Ubuntu 20.04 LTS
    }
  }

  # Network interface setup (default network)
  network_interface {
    network = "default"  # Using default network

    access_config {}  # Allocate ephemeral public IP
  }
}
