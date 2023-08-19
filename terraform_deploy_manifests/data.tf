# Defining data source to get the access to the effective Account ID

data "aws_caller_identity" "current" {}


# Retrieve Current Secret Version
data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id = var.rds_cred_secret
}