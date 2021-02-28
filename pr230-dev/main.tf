terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
  }

  backend "gcs" {
    bucket      = "tf-state-pr230-dev"
    prefix      = "terraform/state"
    credentials = "./key.json"
  }
}

provider "google" {
  # version     = "3.39.0"
  credentials = file(var.gcp_auth_file)
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
}

provider "google-beta" {
  # version     = "3.8"
  credentials = file(var.gcp_auth_file)
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
}