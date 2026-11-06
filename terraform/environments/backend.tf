terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket = "saurabh-terraform-state-1793950589"
    key    = "infra-as-code-pipeline/terraform.tfstate"
    region = "ap-south-1"

    encrypt      = true
    use_lockfile = true

    workspace_key_prefix = "env"
  }
}
