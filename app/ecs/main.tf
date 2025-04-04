terraform {
  required_version = "~> 1.11"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.94"
    }
  }

  backend "s3" {
    bucket = "cloudtitlan-demos-tf-state"
    key    = "containers-terraform/components/app/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = local.region
  default_tags {
    tags = local.tags
  }
}

locals {
  region        = "us-east-1"
  app_name      = "containers"
  component     = "app"
  port          = 8000
  cpu           = 256
  memory        = 512
  desired_count = 1
  path_rule     = "/*"
  priority      = 100
  environment_variables = []
  tags = {
    Repo                = "cloudtitlan/containers-terraform"
    IaC                 = "terraform"
    Environment         = "demo"
    Component           = local.component
  }
}

module "api" {
  source = "../../aws/modules/ecs-app"

  region                = local.region
  app_name              = local.app_name
  component             = local.component
  image_tag             = var.image_tag
  priority              = local.priority
  path_rule             = local.path_rule
  desired_count         = local.desired_count
  port                  = local.port
  environment_variables = local.environment_variables
  cpu                   = local.cpu
  memory                = local.memory
}

