# Find the Route 53 hosted zone ID
data "aws_route53_zone" "public" {
  name         = "testcgit.xyz."
  private_zone = false
}

# Create the necessary DNS records for validation
resource "aws_route53_record" "testcgit_validation" {
  for_each = {
    for dvo in aws_acm_certificate.prodcert.domain_validation_options : dvo.domain_name => dvo
  }

  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  zone_id = data.aws_route53_zone.public.zone_id
  records = [each.value.resource_record_value]
  ttl     = 60
}

# Wait for the certificate to be validated
resource "aws_acm_certificate_validation" "testcgit" {
  certificate_arn         = aws_acm_certificate.prodcert.arn
  validation_record_fqdns = [for record in aws_route53_record.testcgit_validation : record.fqdn]
}