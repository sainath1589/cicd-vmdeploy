# Specify the provider
provider "google" {
  project = "future-lane-444809-c3" # Replace with your GCP project ID
  region  = "us-central1"         # Replace with your preferred region
  zone    = "us-central1-a"       # Replace with your preferred zone
  credentials = file("key-json") 
  
}
resource "google_compute_instance" "example" {
  name         = "example-vm"
  machine_type = "e2-micro" # Change as per your requirement
  zone         = "us-central1-a" # Replace with your preferred zone

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts" # Debian 11 image
    }
  }

  # Use the default network
  network_interface {
    network = "default" # Reference the default network

    access_config {
      # Ephemeral public IP
    }
  }
}
