variable "eks_cluster_name" {
  description = "Name of EKS cluster"
  type        = string
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
