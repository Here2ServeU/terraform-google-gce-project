variable "gcp_project" {
  description = "GCP Project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP Region"
  type        = string
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type"
  type        = string
}

variable "zone" {
  description = "Compute zone"
  type        = string
}

variable "image" {
  description = "Image of the VM"
  type        = string
}

variable "network" {
  description = "Network for the VM"
  type        = string
}