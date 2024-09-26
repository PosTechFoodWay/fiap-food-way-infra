resource "aws_eks_cluster" "foodway_eks_cluster" {
  name     = "foodway_eks_cluster"
  role_arn = var.lab_role

  vpc_config {
    endpoint_private_access = true
    subnet_ids              = flatten([aws_subnet.public_subnets[*].id, aws_subnet.private_subnets[*].id])
    endpoint_public_access  = true
  }
}

resource "aws_eks_node_group" "foodway_eks_node_group" {
  cluster_name    = aws_eks_cluster.foodway_eks_cluster.name
  node_group_name = "foodway_eks_node"
  node_role_arn   = var.lab_role
  subnet_ids      = aws_subnet.private_subnets[*].id

  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [aws_eks_cluster.foodway_eks_cluster]
}
