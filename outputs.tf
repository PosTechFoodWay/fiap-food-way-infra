output "ecr_repository_url" {
  description = "The URL of the ECR repository."
  value       = aws_ecr_repository.foodway_api.repository_url
}