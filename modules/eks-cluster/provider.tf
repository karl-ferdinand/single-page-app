data "aws_eks_cluster_auth" "this" {
  name = aws_eks_cluster.eks_cluster.id
}

provider "kubernetes" {
  host                   = aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks_cluster.certificate_authority.data[0])
  token                  = data.aws_eks_cluster_auth.this.token
}
