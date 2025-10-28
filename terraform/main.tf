resource "google_compute_address" "static_ip" {
  name         = "bap-ip" # A descriptive name for the static IP
  address_type = "EXTERNAL"
  project      = var.project_id
  region       = var.region
  address      = "34.42.232.203" # The static external IP address you want to use - Removed this line because if you specify an address that you don't own you will get an error. You could omit the whole line, or change for an IP you already own.
}

resource "google_compute_instance" "default" {
  name         = "instance-20240803-102209"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 30
      type  = "pd-standard"
    }
  }

  network_interface {
    network    = "default"
    subnetwork = "default"

    access_config {
      nat_ip = google_compute_address.static_ip.address # Assign the static IP
    }
    # network_ip = "10.128.0.2" # Removed this line as the network_ip must be within the subnet range and managed in that way.
  }

  tags = ["http-server", "https-server"]

  metadata = {
    startup-script = <<EOF
#! /bin/bash
adduser karol
echo 'karol:karolpass' | chpasswd

usermod -aG google-sudoers karol
EOF
  }

  service_account {
    email  = google_service_account.default.email # Use the email from the created service account
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
  }
}

resource "google_service_account" "default" {
  account_id   = "gcp-vm-service-account"
  display_name = "Service Account for GCP VM"
}

output "instance_ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}