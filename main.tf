terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.38"
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
