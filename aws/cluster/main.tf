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
    key    = "containers-terraform/ecs/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = local.region
  default_tags {
    tags = local.tags
  }
}
