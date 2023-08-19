# Handling Key-Value Secret Strings in JSON // Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration
locals {
  db_cred = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)
}