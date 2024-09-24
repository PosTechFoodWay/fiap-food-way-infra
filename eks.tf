resource "aws_eks_cluster" "foodway_eks_cluster" {
  name     = "foodway_eks_cluster"
  role_arn = var.lab_role

  vpc_config {
    subnet_ids = [aws_subnet.subnet-msv-a.id, aws_subnet.subnet-msv-b.id]
  }
}

resource "aws_eks_fargate_profile" "foodway_fargate" {
  cluster_name           = aws_eks_cluster.foodway_eks_cluster.name
  fargate_profile_name   = "foodway_fargate_profile"
  pod_execution_role_arn = var.lab_role

  subnet_ids = [aws_subnet.subnet-msv-a.id, aws_subnet.subnet-msv-b.id]

  selector {
    namespace = "foodway"
  }
}
