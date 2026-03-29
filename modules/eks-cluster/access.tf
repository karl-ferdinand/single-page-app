# resource "aws_eks_access_entry" "access_entry" {
#   cluster_name  = aws_eks_cluster.eks_cluster.id
#   principal_arn = var.iam_principal
#   type          = "STANDARD"
# }

# resource "aws_eks_access_policy_association" "access_policy" {
#   cluster_name  = aws_eks_cluster.eks_cluster.id
#   policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
#   principal_arn = aws_eks_access_entry.access_entry.principal_arn

#   access_scope {
#     type = "cluster"
#   }
# }

# resource "aws_eks_access_entry" "deploy_principal_entry" {
#   cluster_name  = aws_eks_cluster.eks_cluster.id
#   principal_arn = var.deploy_principal
#   type          = "STANDARD"
# }

# resource "aws_eks_access_policy_association" "deploy_principal_policy" {
#   cluster_name  = aws_eks_cluster.eks_cluster.id
#   policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
#   principal_arn = aws_eks_access_entry.deploy_principal_entry.principal_arn

#   access_scope {
#     type = "cluster"
#   }
# }
