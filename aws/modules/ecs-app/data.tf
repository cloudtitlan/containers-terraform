data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.app_name}/vpc-id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.app_name}/private-subnet-ids"
}

data "aws_ssm_parameter" "app_sg_id" {
  name = "/${var.app_name}/app-security-group-id"
}

data "aws_ssm_parameter" "listener_arn" {
  name = "/${var.app_name}/https-listener-arn"
}

data "aws_ssm_parameter" "ecr_repo_url" {
  name = "/${var.app_name}/ecr/${var.app_name}-${var.component}"
}
