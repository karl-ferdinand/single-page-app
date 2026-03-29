output "eks_cluster_name" {
  description = "Name of EKS cluster"
  value       = aws_eks_cluster.eks_cluster.id
}
