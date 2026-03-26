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
  source      = "./modules/single-page-app"
  bucket_name = var.bucket_name
}
