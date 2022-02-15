################################################################################################################################
# variables.tf
#
# This is the root module's variables configuration file. 
# The values specified here are used by the provider block in main.tf and are passed to child modules as input parameters.
# 
# Learn more by reading the docs: https://www.terraform.io/docs/configuration/variables.html
################################################################################################################################

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# Static project variables
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

variable "region" {
  default = "us-east1"
}

variable "zone" {
  default = "us-east1-b"
}

variable "project_id" {
  default = "waves-infra"
}

# its prod as far as the one user is concerned, aka me
variable "environment" {
  default = "prod"
}

variable "label_domain" {
  default = "shared-services"
}
