variable "bucket_name" {
  description = "Name of S3 bucket"
  type        = string
}

variable "s3_origin_id" {
  description = "Name of S3 origin"
  type        = string
}

variable "function_name" {
  description = "Name of Lambda function"
  type        = string
}

variable "topic_name" {
  description = "Name of SNS topic"
  type        = string
}

variable "notification_email" {
  description = "Email for notification"
  type        = string
  sensitive   = true
}
