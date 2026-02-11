resource "aws_acm_certificate" "prodcert" {
  domain_name       = "app.testcgit.xyz"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true # Ensures minimal downtime during certificate renewal
  }
}