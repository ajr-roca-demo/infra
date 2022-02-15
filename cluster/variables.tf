################################################################################################################################
# cluster/variables.tf
#
# This is the cluster module's variables configuration file. These variables are set by input parameters in the main main.tf file.
################################################################################################################################

## cluster level 

variable "cluster_name" {
  default = "shared-gke"
}

## input variables

variable "project_id" {
  type = string
}

variable "label_domain" {
  type = string
}
