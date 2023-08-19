module "vpc" {
  source = "./modules/aws_vpc"

  vpc_cidr_block           = var.vpc_cidr_block
  vpc_enable_dns_hostnames = var.vpc_enable_dns_hostnames

  vpc_tags = var.vpc_tags

  gw_tags = var.gw_tags


  public_subnet_1_cidr_block     = var.public_subnet_1_cidr_block
  public_map_public_ip_on_launch = var.public_map_public_ip_on_launch
  availability_zone_1            = var.availability_zone_1
  public_subnet_1_tags           = var.public_subnet_1_tags


  public_subnet_2_cidr_block = var.public_subnet_2_cidr_block
  availability_zone_2        = var.availability_zone_2
  public_subnet_2_tags       = var.public_subnet_2_tags


  private_subnet_1_cidr_block     = var.private_subnet_1_cidr_block
  private_map_public_ip_on_launch = var.private_map_public_ip_on_launch
  private_subnet_1_tags           = var.private_subnet_1_tags


  private_subnet_2_cidr_block = var.private_subnet_2_cidr_block
  private_subnet_2_tags       = var.private_subnet_2_tags

}

#####################################################################################
module "security_group_rds" {
  source = "./modules/aws_security_grp"

  security_group_name        = var.rds_security_group_name
  security_group_description = var.rds_security_group_description
  vpc_id                     = module.vpc.vpc_id


  ingess_from_port   = var.rds_ingress_from_port
  ingress_to_port    = var.rds_ingress_to_port
  ingress_protocol   = var.rds_ingress_protocol
  ingess_cidr_blocks = var.rds_ingress_cidr_blocks

  egress_from_port    = var.rds_egress_from_port
  egress_to_port      = var.rds_egress_to_port
  egress_protocol     = var.rds_egress_protocol
  egress_cidr_blocks  = var.rds_egress_cidr_blocks
  security_group_tags = var.rds_security_group_tags
}

module "db_rds_instance" {
  source = "./modules/aws_rds_instance"

  parameter_group_name        = var.parameter_group_name
  family                      = var.family
  parameter_group_description = var.parameter_group_description
  db_subnet_group_name        = var.db_subnet_group_name
  subnet_ids                  = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id]

  option_group_name        = var.option_group_name
  option_group_description = var.option_group_description
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version

  identifier                          = var.identifier
  instance_class                      = var.instance_class
  max_allocated_storage               = var.max_allocated_storage
  allocated_storage                   = var.allocated_storage
  storage_type                        = var.storage_type
  engine                              = var.engine
  engine_version                      = var.engine_version
  db_name                             = var.db_name
  multi_az                            = var.multi_az
  username                            = local.db_cred["username"]
  password                            = local.db_cred["password"]
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  storage_encrypted                   = var.storage_encrypted
  publicly_accessible                 = var.publicly_accessible
  skip_final_snapshot                 = var.skip_final_snapshot
  deletion_protection                 = var.deletion_protection # Database Deletion Protection
  vpc_security_group_ids              = [module.security_group_rds.security_group_id]
  db_instance_tags                    = var.db_instance_tags
}
##############################################################################################
module "security_group_ec2" {
  source = "./modules/aws_security_grp"

  security_group_name        = var.ec2_security_group_name
  security_group_description = var.ec2_security_group_description
  vpc_id                     = module.vpc.vpc_id


  ingess_from_port   = var.ec2_ingress_from_port
  ingress_to_port    = var.ec2_ingress_to_port
  ingress_protocol   = var.ec2_ingress_protocol
  ingess_cidr_blocks = var.ec2_ingress_cidr_blocks

  egress_from_port    = var.ec2_egress_from_port
  egress_to_port      = var.ec2_egress_to_port
  egress_protocol     = var.ec2_egress_protocol
  egress_cidr_blocks  = var.ec2_egress_cidr_blocks
  security_group_tags = var.ec2_security_group_tags
}

module "ec2_instance_1" {
  source = "./modules/aws_ec2_instance"

  ec2_instance_ami                         = var.ec2_instance_ami
  ec2_instance_type                        = var.ec2_instance_type
  ec2_instance_availability_zone           = var.availability_zone_1
  ec2_instance_subnet_id                   = module.vpc.private_subnet_1_id
  ec2_instance_vpc_security_group_ids      = [module.security_group_ec2.security_group_id]
  ec2_instance_key_name                    = var.ec2_instance_key_name
  ec2_instance_associate_public_ip_address = var.ec2_instance_associate_public_ip_address

  ec2_isntance_root_block_device = var.ec2_isntance_root_block_device

  ec2_instance_tags = var.ec2_instance_tags_1
}

module "ec2_instance_2" {
  source = "./modules/aws_ec2_instance"

  ec2_instance_ami                         = var.ec2_instance_ami
  ec2_instance_type                        = var.ec2_instance_type
  ec2_instance_availability_zone           = var.availability_zone_2
  ec2_instance_subnet_id                   = module.vpc.private_subnet_2_id
  ec2_instance_vpc_security_group_ids      = [module.security_group_ec2.security_group_id]
  ec2_instance_key_name                    = var.ec2_instance_key_name
  ec2_instance_associate_public_ip_address = var.ec2_instance_associate_public_ip_address

  ec2_isntance_root_block_device = var.ec2_isntance_root_block_device

  ec2_instance_tags = var.ec2_instance_tags_2
}

###########################################################
module "security_group_alb" {
  source = "./modules/aws_security_grp"

  security_group_name        = var.alb_security_group_name
  security_group_description = var.alb_security_group_description
  vpc_id                     = module.vpc.vpc_id


  ingess_from_port   = var.alb_ingress_from_port
  ingress_to_port    = var.alb_ingress_to_port
  ingress_protocol   = var.alb_ingress_protocol
  ingess_cidr_blocks = var.alb_ingress_cidr_blocks

  egress_from_port    = var.alb_egress_from_port
  egress_to_port      = var.alb_egress_to_port
  egress_protocol     = var.alb_egress_protocol
  egress_cidr_blocks  = var.alb_egress_cidr_blocks
  security_group_tags = var.alb_security_group_tags
}


module "alb" {
  source = "./modules/aws_elb"

  aws_lb_target_group_name     = var.aws_lb_target_group_name
  aws_lb_target_group_port     = var.aws_lb_target_group_port
  aws_lb_target_group_protocol = var.aws_lb_target_group_protocol
  aws_lb_target_group_vpc_id   = module.vpc.vpc_id

  aws_lb_target_group_attachment_target_id_1 = module.ec2_instance_1.ec2_instance_id

  aws_lb_target_group_attachment_target_id_2 = module.ec2_instance_2.ec2_instance_id


  aws_lb_name               = var.aws_lb_name
  aws_lb_internal           = var.aws_lb_internal
  aws_lb_load_balancer_type = var.aws_lb_load_balancer_type
  aws_lb_security_groups    = [module.security_group_alb.security_group_id]
  aws_lb_subnets            = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]

  aws_lb_enable_deletion_protection = var.aws_lb_enable_deletion_protection

  aws_lb_access_logs_bucket  = var.aws_lb_access_logs_bucket
  aws_lb_access_logs_prefix  = var.aws_lb_access_logs_prefix
  aws_lb_access_logs_enabled = var.aws_lb_access_logs_enabled
  aws_lb_tags                = var.aws_lb_tags

}