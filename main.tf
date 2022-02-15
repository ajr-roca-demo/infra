################################################################################################################################
# main.tf
#
# This is the entry point configuration file for the project. It includes the top level modules required for this project.
# In the module declaration blocks, input variables are set to the values of the variables defined in variables.tf.
# Input variables are how you pass environment variables, modules outputs, and/or static default values to child modules.
#
# Learn more by reading the docs: https://www.terraform.io/docs/configuration/modules.html
################################################################################################################################

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# providers
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.location
}

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# terraform settings and state bucket
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

terraform {
  required_version = ">= 0.13"
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
  backend "gcs" {
    bucket = "tf-${var.project_id}-${var.environment}"
    prefix = "state"
  }
}

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# modules
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

module "cluster" {
  source = "./modules/cluster"

  project_id   = var.project_id
  label_domain = var.label_domain
}
