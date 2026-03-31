variable "bucket_name" {
  description = "Name of S3 bucket"
  type        = string
  default     = "single-page-app-html"
}

variable "s3_origin_id" {
  description = "Name of S3 origin"
  type        = string
  default     = "s3-origin"
}

variable "function_name" {
  description = "Name of Lambda function"
  type        = string
  default     = "single-page-lambda-function"
}

variable "eks_cluster_name" {
  description = "Name of EKS cluster"
  type        = string
  default     = "inflate-cluster"
}

variable "subnet_id_a" {
  description = "ID of subnet A"
  type        = string
  sensitive   = true
}

variable "subnet_id_b" {
  description = "ID of subnet B"
  type        = string
  sensitive   = true
}

variable "subnet_id_c" {
  description = "ID of subnet C"
  type        = string
  sensitive   = true
}

variable "iam_principal" {
  description = "ARN of IAM principal to access EKS cluster"
  type        = string
  sensitive   = true
}

variable "deploy_principal" {
  description = "ARN of IAM principal to deploy to EKS cluster"
  type        = string
  sensitive   = true
}
