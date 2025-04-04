output "app_dns" {
  value = "https://${local.subdomain}.${local.domain_name}"
}

resource "aws_ssm_parameter" "ecr_repo_url" {
  for_each = local.ecr_repos

  name  = "/${local.app_name}/ecr/${each.key}"
  type  = "String"
  value = aws_ecr_repository.repo[each.key].repository_url
}

resource "aws_ssm_parameter" "listener_arn" {
  name  = "/${local.app_name}/https-listener-arn"
  type  = "String"
  value = aws_lb_listener.https.arn
}

resource "aws_ssm_parameter" "app_sg_id" {
  name  = "/${local.app_name}/app-security-group-id"
  type  = "String"
  value = aws_security_group.ecs_sg.id
}
