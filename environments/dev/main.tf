terraform {
  backend "gcs" {
    bucket  = "terraform-state-bucket-2025"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

module "compute_instance" {
  source        = "../../modules/compute_instance"
  instance_name = var.instance_name
  machine_type  = var.machine_type
  zone          = var.zone
  image         = var.image
  network       = var.network
}