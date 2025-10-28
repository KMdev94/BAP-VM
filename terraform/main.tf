resource "google_compute_instance" "default" {
  name         = "instance-20240803-102209" # Name from your VM
  machine_type = var.machine_type # e2-micro
  zone         = var.zone         # us-central1-c

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12" # Boot disk source image from your VM
      size  = 30                      # Boot disk size from your VM
      type  = "pd-standard"           # Boot disk type (Standard persistent disk)
    }
  }

  network_interface {
    network    = "default" # Network from your VM
    subnetwork = "default" # Subnetwork from your VM

    access_config {
      // Ephemeral IP - Your VM has an external IP
    }
    network_ip = "10.128.0.2" # Primary internal IP address from your VM
  }

  // Adding network tags from your VM
  tags = ["http-server", "https-server"]

  // Startup script from your VM metadata
  metadata = {
    startup-script = <<EOF
#! /bin/bash
adduser karol
echo 'karol:karolpass' | chpasswd

usermod -aG google-sudoers karol
EOF
  }

  service_account {
    email  = "398356370811-compute@developer.gserviceaccount.com" # Service account from your VM
    scopes = ["https://www.googleapis.com/auth/cloud-platform"] // Allow default access
  }

  // Shielded VM configuration from your VM
  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  // Availability policies from your VM
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE" // Migrate VM instance
    preemptible         = false     // Off (Recommended)
  }
}

resource "google_service_account" "default" {
  account_id   = "gcp-vm-service-account"
  display_name = "Service Account for GCP VM"
}

output "instance_ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}