output "bucket_name" {
  description = "Name of S3 bucket"
  value       = aws_s3_bucket.html_bucket.id
}

output "distribution_domain_name" {
  description = "Domain name of CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "function_name" {
  description = "Name of Lambda function"
  value       = aws_lambda_function.lambda_function.function_name
}
