variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "project_name" {
  type    = string
  default = "niranjan-devops"
}

variable "cluster_name" {
  type    = string
  default = "niranjan-eks"
}

variable "state_bucket_name" {
  type = string
}

variable "github_repository" {
  type        = string
  description = "GitHub repository in owner/repository format."
  default     = "YOUR_GITHUB_ORG/YOUR_REPO"
}

variable "dockerhub_username" {
  type    = string
  default = "YOUR_DOCKERHUB_USERNAME"
}

variable "domain_name" {
  type    = string
  default = ""
}

variable "route53_zone_id" {
  type    = string
  default = ""
}
