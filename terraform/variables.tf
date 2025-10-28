variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1" # Your VM's region derived from zone
}

variable "zone" {
  description = "The GCP zone to deploy resources"
  type        = string
  default     = "us-central1-c" # Zone from your VM
}

variable "instance_name" {
  description = "The name of the GCP VM instance"
  type        = string
  default     = "instance-20240803-102209" # Name from your VM
}

variable "machine_type" {
  description = "The machine type for the GCP VM instance"
  type        = string
  default     = "e2-micro" # Machine type from your VM
}

variable "nginx_port" {
  description = "The port on which Nginx will listen"
  type        = number
  default     = 80
}

variable "gunicorn_port" {
  description = "The port on which Gunicorn will listen"
  type        = number
  default     = 8000
}

variable "service_account_email" {
  description = "The email of the service account to use"
  type        = string
  default     = "398356370811-compute@developer.gserviceaccount.com" # Service account email from your VM
}