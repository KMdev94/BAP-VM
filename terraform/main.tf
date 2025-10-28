resource "google_compute_instance" "default" {
  name         = "gcp-vm-instance"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = file("scripts/setup.sh")

  service_account {
    email  = google_service_account.default.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

resource "google_service_account" "default" {
  account_id   = "gcp-vm-service-account"
  display_name = "Service Account for GCP VM"
}

output "instance_ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}