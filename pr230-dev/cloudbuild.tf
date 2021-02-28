resource "google_cloudbuild_trigger" "Build_deploy_FAE_Optimise_Transform" {
  description = "Build deploy Carbon Calculator"
  disabled = false

  trigger_template {
    branch_name = "master"
    repo_name   = "github"  
  }

  substitutions = {
    _CICD_STORE_SUFFIX: var.cicd_store_suffix,
    _PROMOTE_PROJECT_ID: var.gcp_promote_project,
    _REGION: var.gcp_region,
    _IMAGE_NAME: var.transform_image,
    _SERVICE_NAME: google_cloud_run_service.fae_optimise_transform_cloud_run.name,
    _SECRET: var.transform_secret
  }

  filename = "cloudbuild.yaml"
}
