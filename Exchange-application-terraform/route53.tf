data "aws_route53_zone" "hosted_zone" {
  zone_id = var.hosted_zone
}

resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = aws_lb.frontend-lb.dns_name
    zone_id                = aws_lb.frontend-lb.zone_id
    evaluate_target_health = true
  }

}

