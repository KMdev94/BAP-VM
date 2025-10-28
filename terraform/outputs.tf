output "vm_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}

output "vm_name" {
  value = google_compute_instance.vm_instance.name
}

output "vm_zone" {
  value = google_compute_instance.vm_instance.zone
}