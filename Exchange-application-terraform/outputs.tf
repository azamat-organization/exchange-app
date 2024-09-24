output "public_ip" {
  value       = aws_instance.Bastion-Host.public_ip
  description = "The public IP of the web server"
}


output "exchange_app_dns" {
  value = "${aws_route53_record.site_domain.name}.${data.aws_route53_zone.hosted_zone.name}"

}