output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.networking.private_subnet_ids
}

output "ecs_security_group_id" {
  description = "ECS Security Group ID"
  value       = module.security.ecs_security_group_id
}

output "alb_security_group_id" {
  description = "ALB Security Group ID"
  value       = module.security.alb_security_group_id
}
output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = module.ecr.repository_url
}
output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "alb_dns_name" {
  description = "Public URL of the application"
  value       = module.ecs.alb_dns_name
}
output "github_actions_role_arn" {
  description = "IAM role ARN used by GitHub Actions for CI/CD"
  value       = module.github_oidc.github_actions_role_arn
}
