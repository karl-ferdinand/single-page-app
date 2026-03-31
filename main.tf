terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.38"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = "ap-southeast-2"

  default_tags {
    tags = {
      Application = "single-page-app"
      ManagedBy   = "Terraform"
    }
  }
}

module "single_page_app" {
  source             = "./modules/single-page-app"
  bucket_name        = var.bucket_name
  s3_origin_id       = var.s3_origin_id
  function_name      = var.function_name
  topic_name         = var.topic_name
  notification_email = var.notification_email
}

# module "eks_cluster" {
#   source           = "./modules/eks-cluster"
#   eks_cluster_name = var.eks_cluster_name
#   subnet_id_a      = var.subnet_id_a
#   subnet_id_b      = var.subnet_id_b
#   subnet_id_c      = var.subnet_id_c
#   iam_principal    = var.iam_principal
#   deploy_principal = var.deploy_principal
# }
