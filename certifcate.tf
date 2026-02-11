resource "aws_acm_certificate" "prodcert" {
  domain_name       = "app.testcgit.xyz"
  validation_method = "DNS"
  # Optional: add subject alternative names for subdomains
  subject_alternative_names = ["*.testcgit.xyz"] 

  lifecycle {
    create_before_destroy = true # Ensures minimal downtime during certificate renewal
  }
}