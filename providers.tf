provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  host                   = aws_eks_cluster.foodway_eks_cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.foodway_eks_cluster.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.foodway_eks_cluster.name]
  }
}
