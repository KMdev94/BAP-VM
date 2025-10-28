variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone to deploy resources"
  type        = string
  default     = "us-central1-a"
}

variable "instance_name" {
  description = "The name of the GCP VM instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the GCP VM instance"
  type        = string
  default     = "e2-medium"
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
}