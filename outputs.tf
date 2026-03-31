output "bucket_name" {
  description = "Name of S3 bucket"
  value       = module.single_page_app.bucket_name
}

output "distribution_domain_name" {
  description = "Domain name of CloudFront distribution"
  value       = module.single_page_app.distribution_domain_name
}

output "function_name" {
  description = "Name of Lambda function"
  value       = module.single_page_app.function_name
}

# output "eks_cluster_name" {
#   description = "Name of EKS cluster"
#   value       = module.eks_cluster.eks_cluster_name
# }
