terraform {
  backend "gcs" {
    bucket = "t2s-bank-terraform-state"
    prefix = "terraform/state/dev"
  }
}