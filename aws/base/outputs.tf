resource "aws_ssm_parameter" "cert_arn" {
  name  = "/${local.app_name}/demos-cloudtitlan-cert"
  type  = "String"
  value = aws_acm_certificate.demos_wildcard.arn
}

resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${local.app_name}/vpc-id"
  type  = "String"
  value = module.vpc.vpc_id
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${local.app_name}/private-subnet-ids"
  type  = "StringList"
  value = join(",", module.vpc.private_subnets)
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${local.app_name}/public-subnet-ids"
  type  = "StringList"
  value = join(",", module.vpc.public_subnets)
}
