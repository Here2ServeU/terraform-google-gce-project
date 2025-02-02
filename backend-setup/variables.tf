variable "gcp_project" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "gcp_region" {
  description = "The region where the bucket will be created"
  type        = string
  default     = "us-east1"
}

variable "gcs_bucket_name" {
  description = "The name of the GCS bucket for storing Terraform state"
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account with permissions on the GCS bucket"
  type        = string
}