# DB Option Group
resource "aws_db_option_group" "db_option_group" {
  name                     = var.option_group_name
  option_group_description = var.option_group_description
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version
}

# DB Parameter Group
resource "aws_db_parameter_group" "db_parameter_group" {
  name        = var.parameter_group_name
  family      = var.family
  description = var.parameter_group_description
}

# DB Subnet Group
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids
}

# DB Instance
resource "aws_db_instance" "db_instance" {
  identifier                          = var.identifier
  instance_class                      = var.instance_class
  max_allocated_storage               = var.max_allocated_storage
  allocated_storage                   = var.allocated_storage
  storage_type                        = var.storage_type
  engine                              = var.engine
  engine_version                      = var.engine_version
  db_name                             = var.db_name
  multi_az                            = var.multi_az
  username                            = var.username
  password                            = var.password
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  parameter_group_name                = var.parameter_group_name
  db_subnet_group_name                = var.db_subnet_group_name
  storage_encrypted                   = var.storage_encrypted
  publicly_accessible                 = var.publicly_accessible
  skip_final_snapshot                 = var.skip_final_snapshot
  deletion_protection                 = var.deletion_protection # Database Deletion Protection
  vpc_security_group_ids              = var.vpc_security_group_ids
  tags                                = var.db_instance_tags
  depends_on = [
    aws_db_option_group.db_option_group,
    aws_db_parameter_group.db_parameter_group,
    aws_db_subnet_group.db_subnet_group
  ]
}