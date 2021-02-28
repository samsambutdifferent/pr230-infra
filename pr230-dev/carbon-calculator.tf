#####################################################################################
# CLOUD RUN
#####################################################################################
resource "google_cloud_run_service" "carbon_calculator_cloud_run" {
  name     = "carbon-calculator"
  location = var.gcp_region
  autogenerate_revision_name = true
  template {

    metadata {
      annotations = {
          "autoscaling.knative.dev/maxScale"  = "80"
          "client.knative.dev/user-image"     = "gcr.io/${var.gcp_project}/${var.filter_image}:${var.filter_image_tag}"
          "run.googleapis.com/client-name"    = "gcloud"
          "run.googleapis.com/client-version" = "308.0.0"
        }
      labels      = {}
    }

    spec {

      container_concurrency = 4
      timeout_seconds = 300
      containers {
        image = "gcr.io/${var.gcp_project}/${var.filter_image}:${var.filter_image_tag}"
        resources {
          limits   = {
            "cpu"    = "1000m"
            "memory" = "1Gi"
          }
        }

        env {
          name = "bucket_name"
          value = var.main_gcs_bucket
        }
      }
    } 
  }


  traffic {
    percent         = 100
    latest_revision = true
  }
}

#####################################################################################
# PERMISSION
#####################################################################################
data "google_iam_policy" "carbon_calculator_noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "carbon_calculator_noauth" {
  location    = var.gcp_region
  service     = google_cloud_run_service.carbon_calculator_cloud_run.name

  policy_data = data.google_iam_policy.carbon_calculator_noauth.policy_data
}