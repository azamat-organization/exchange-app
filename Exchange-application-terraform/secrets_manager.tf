data "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = var.db_secret_url
}

output "db_secret_url" {
  value     = jsondecode(data.aws_secretsmanager_secret_version.db_credentials.secret_string)["DB"]
  sensitive = true
}

