resource "aws_acm_certificate" "demos_wildcard" {
  domain_name       = "*.${local.domain_name}"
  validation_method = "DNS"
}

data "aws_route53_zone" "example" {
  name         = local.domain_name
  private_zone = false
}

resource "aws_route53_record" "validation_records" {
  for_each = {
    for dvo in aws_acm_certificate.demos_wildcard.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.example.zone_id
}

resource "aws_acm_certificate_validation" "validation" {
  certificate_arn         = aws_acm_certificate.demos_wildcard.arn
  validation_record_fqdns = [for record in aws_route53_record.validation_records : record.fqdn]
}
