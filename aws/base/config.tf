locals {
  region      = "us-east-1"
  app_name    = "containers"
  domain_name = "demos.cloudtitlan.com"
  vpc = {
    name            = "${local.app_name}-vpc"
    cidr            = "10.0.0.0/16"
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  }
  tags = {
    Repo                = "cloudtitlan/containers-terraform"
    IaC                 = "terraform"
    Environment         = "demo"
    devops-guru-enabled = "false"
  }
}
