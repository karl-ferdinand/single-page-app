output "bucket_name" {
  description = "Name of S3 bucket"
  value       = module.single_page_app.bucket_name
}

output "eks_cluster_name" {
  description = "Name of EKS cluster"
  value       = module.eks_cluster.eks_cluster_name
}
