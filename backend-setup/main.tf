terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  
  backend "gcs" {
    bucket = var.gcs_bucket_name
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

resource "google_storage_bucket" "terraform_state" {
  name          = var.gcs_bucket_name
  location      = var.gcp_region
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365 # Delete objects older than 1 year
    }
  }
}

resource "google_storage_bucket_iam_binding" "terraform_state_binding" {
  bucket = google_storage_bucket.terraform_state.name
  role   = "roles/storage.admin"
  
  members = [
    "serviceAccount:${var.service_account_email}"
  ]
}