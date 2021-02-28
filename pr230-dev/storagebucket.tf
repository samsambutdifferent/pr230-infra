####################################################################################
# BUCKETS
####################################################################################
resource "google_storage_bucket" "main_store" {
  name          = var.main_gcs_bucket
  location      = var.gcp_region
  force_destroy = false
  storage_class = "REGIONAL"

  uniform_bucket_level_access  = true
}

