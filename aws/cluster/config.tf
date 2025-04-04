locals {
  region      = "us-east-1"
  app_name    = "containers"
  domain_name = "demos.cloudtitlan.com"
  subdomain   = "containers"
  ecr_repos = toset([
    "containers-app",
  ])
  tags = {
    Repo                = "cloudtitlan/containers-terraform"
    IaC                 = "terraform"
    Environment         = "demo"
  }
}
