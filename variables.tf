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

variable "topic_name" {
  description = "Name of SNS topic"
  type        = string
  default     = "error-notification"
}

variable "notification_email" {
  description = "Email for notification"
  type        = string
  sensitive   = true
}
