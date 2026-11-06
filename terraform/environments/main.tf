module "networking" {
  source = "../modules/networking"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  common_tags = {
    Project     = "Ecommerce-DevOps"
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
  }
}

module "security" {
  source = "../modules/security"

  project_name = var.project_name
  vpc_id       = module.networking.vpc_id
  app_port     = 3000

  common_tags = {
    Project     = "Ecommerce-DevOps"
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
  }
}
module "ecr" {
  source = "../modules/ecr"

  repository_name = "${var.project_name}-app"

  common_tags = {
    Project     = "Ecommerce-DevOps"
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
  }
}
module "ecs" {
  source = "../modules/ecs"

  project_name = var.project_name
  aws_region   = "ap-south-1"

  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids

  alb_security_group_id = module.security.alb_security_group_id
  ecs_security_group_id = module.security.ecs_security_group_id

  ecr_repository_url = module.ecr.repository_url
  image_tag          = "1.0"
  container_port     = 3000

  common_tags = {
    Project     = "Ecommerce-DevOps"
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
  }
}
