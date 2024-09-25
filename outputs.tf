output "ecr_repository_url" {
  description = "The URL of the ECR repository."
  value       = aws_ecr_repository.foodway_api.repository_url
}

output "foodway_cluster_name" {
  description = "Cluster Name"
  value       = aws_eks_cluster.foodway_eks_cluster.name
}

output "foodway_cluster_endpoint" {
  description = "Cluster Endpoint"
  value       = aws_eks_cluster.foodway_eks_cluster.endpoint
}

output "foodway_node_endpoint" {
  description = "Cluster Node Group Status"
  value       = aws_eks_node_group.foodway_eks_node_group.status
}
