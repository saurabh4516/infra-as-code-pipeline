variable "project_name" {
  type = string
}

variable "github_repository" {
  description = "GitHub repository in owner/repo format"
  type        = string
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "common_tags" {
  type    = map(string)
  default = {}
}
variable "ecr_repository_arn" {
  description = "ARN of the ECR repository"
  type        = string
}

variable "ecs_service_arn" {
  description = "ARN of the ECS service"
  type        = string
}

variable "ecs_execution_role_arn" {
  description = "ARN of the ECS execution role"
  type        = string
}
