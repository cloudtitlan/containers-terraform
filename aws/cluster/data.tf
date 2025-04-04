data "aws_ssm_parameter" "cert_arn" {
  name = "/${local.app_name}/demos-cloudtitlan-cert"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${local.app_name}/vpc-id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${local.app_name}/public-subnet-ids"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${local.app_name}/public-subnet-ids"
}

data "aws_route53_zone" "cloudtitlan_demos" {
  name         = local.domain_name
  private_zone = false
}
