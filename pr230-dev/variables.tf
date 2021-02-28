# -----------------------------------------------
# GCP Variables
# -----------------------------------------------
variable "gcp_region" {
  type        = string
  description = "GCP region"
  default = "europe-west1"
}

variable "gcp_zone" {
  type        = string
  description = "GCP zone"
  default = "europe-west1-b"
}

variable "gcp_project" {
  type        = string
  description = "GCP project name"
  default     = "pr230"
}

variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
  default     = "./key.json"
}

# -----------------------------------------------
# Carbon Calculator Variables
# -----------------------------------------------
variable "carbon_calculator_secret" {
  type        = string
  description = "Carbon Calculator secret name"
  default     = "carbon-calculator"
}

variable "carbon_calculator_image" {
  type        = string
  description = "Carbon Calculator name"
  default     = "carbon-calculator"
}

variable "carbon_calculator_tag" {
  type        = string
  description = "Carbon Calculator image tag"
  default     = "latest"
}