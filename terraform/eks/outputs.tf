output "eks_cluster_name" {
  value = aws_eks_cluster.main.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "github_actions_role_arn" {
  value = aws_iam_role.github_actions.arn
}

output "alb_controller_role_arn" {
  value = aws_iam_role.alb_controller.arn
}
