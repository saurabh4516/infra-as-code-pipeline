output "cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "service_name" {
  value = aws_ecs_service.app.name
}

output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer"
  value       = aws_lb.app.dns_name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.app.arn
}
output "service_arn" {
  description = "ECS service ARN"
  value       = aws_ecs_service.app.id
}

output "execution_role_arn" {
  description = "ECS execution role ARN"
  value       = aws_iam_role.ecs_execution.arn
}
