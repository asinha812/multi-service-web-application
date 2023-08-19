variable "aws_region" {}

################################################################
variable "vpc_cidr_block" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
  default     = null
}

variable "vpc_enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "public_subnet_1_cidr_block" {
  description = "The IPv4 CIDR block for the Subnet."
  type        = string
  default     = null
}

variable "public_subnet_2_cidr_block" {
  description = "The IPv4 CIDR block for the Subnet."
  type        = string
  default     = null
}

variable "private_subnet_1_cidr_block" {
  description = "The IPv4 CIDR block for the Subnet."
  type        = string
  default     = null
}

variable "private_subnet_2_cidr_block" {
  description = "The IPv4 CIDR block for the Subnet."
  type        = string
  default     = null
}

variable "public_map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
  type        = bool
  default     = false
}

variable "private_map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
  type        = bool
  default     = false
}

variable "availability_zone_1" {
  description = "AZ for the subnet."
  type        = string
  default     = null
}

variable "availability_zone_2" {
  description = "AZ for the subnet."
  type        = string
  default     = null
}

variable "vpc_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = null
}

variable "gw_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = null
}

variable "nat_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = null
}

variable "public_subnet_1_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = null
}

variable "public_subnet_2_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = null
}

variable "private_subnet_1_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = null
}

variable "private_subnet_2_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = null
}

####################################################################
#RDS SG

variable "rds_security_group_name" {
  description = "Name of security group - not required if create_sg is false"
  type        = string
  default     = null
}

variable "rds_security_group_description" {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}

variable "rds_egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "rds_ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "rds_vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
  type        = string
  default     = null
}

variable "rds_ingress_from_port" {}

variable "rds_ingress_to_port" {}

variable "rds_ingress_protocol" {}

variable "rds_egress_from_port" {}

variable "rds_egress_to_port" {}

variable "rds_egress_protocol" {}

variable "rds_security_group_tags" {
  description = "A mapping of tags to assign to security group"
  type        = map(string)
  default     = {}
}

#################################################################
# DB option group
variable "create_db_option_group" {
  description = "Create a database option group"
  type        = bool
  default     = true
}

variable "option_group_name" {
  description = "Name of the option group"
  type        = string
  default     = null
}

variable "option_group_description" {
  description = "The description of the option group"
  type        = string
  default     = null
}

variable "engine_name" {
  description = "Name of the option group"
  type        = string
  default     = null
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
  default     = null
}

# DB parameter group
variable "create_db_parameter_group" {
  description = "Whether to create a database parameter group"
  type        = bool
  default     = true
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate or create"
  type        = string
  default     = null
}

variable "parameter_group_description" {
  description = "Description of the DB parameter group to create"
  type        = string
  default     = null
}

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = null
}

variable "db_subnet_name" {
  type    = string
  default = null
}

# DB subnet group
variable "create_db_subnet_group" {
  description = "Whether to create a database subnet group"
  type        = bool
  default     = false
}

variable "db_subnet_group_description" {
  description = "Description of the DB subnet group to create"
  type        = string
  default     = null
}

# DB Instance
variable "db_name" {
  type    = string
  default = null
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = ""
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = null
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
  default     = null
}

variable "storage_type" {
  description = "The type of storage"
  type        = string
  default     = "iops"
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = null
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = false
}

variable "max_allocated_storage" {
  description = "Specifies the value for Storage Autoscaling"
  type        = number
  default     = 0
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true"
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled"
  type        = bool
  default     = false
}

variable "performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years)"
  type        = number
  default     = 7
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = null
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60"
  type        = number
  default     = 0
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = null
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type        = string
  default     = null
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)"
  type        = list(string)
  default     = []
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = string
  default     = null
}

variable "network_type" {
  description = "The type of network stack to use"
  type        = string
  default     = null
}

variable "db_instance_tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "rds_cred_secret" {}

#########################################################################
variable "ec2_security_group_name" {
  description = "Name of security group - not required if create_sg is false"
  type        = string
  default     = null
}

variable "ec2_security_group_description" {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}

variable "ec2_egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ec2_ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ec2_vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
  type        = string
  default     = null
}

variable "ec2_ingress_from_port" {}

variable "ec2_ingress_to_port" {}

variable "ec2_ingress_protocol" {}

variable "ec2_egress_from_port" {}

variable "ec2_egress_to_port" {}

variable "ec2_egress_protocol" {}

variable "ec2_security_group_tags" {
  description = "A mapping of tags to assign to security group"
  type        = map(string)
  default     = {}
}

###############################################################################
variable "ec2_instance_ami" {
  description = "AMI to use for the instance"
  type        = string
  default     = null
}

variable "ec2_instance_type" {
  description = "Instance type to use for the instance"
  type        = string
  default     = null
}

variable "ec2_instance_associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC."
  type        = bool
  default     = false
}

variable "ec2_isntance_root_block_device" {
  type = object({
    delete_on_termination = bool
    encrypted             = bool
    volume_size           = number
    volume_type           = string
  })
  default = null
}

variable "ec2_instance_key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}

variable "ec2_instance_tags_1" {
  description = "Map of tags assigned to the resource"
  type        = map(string)
  default     = null
}

variable "ec2_instance_tags_2" {
  description = "Map of tags assigned to the resource"
  type        = map(string)
  default     = null
}

#########################################################################
variable "aws_lb_target_group_name" {
  description = "Name of the target group."
  type        = string
  default     = null
}

variable "aws_lb_target_group_port" {
  description = "Port on which targets receive traffic, unless overridden when registering a specific target."
  type        = string
  default     = null
}

variable "aws_lb_target_group_protocol" {
  description = "Protocol to use for routing traffic to the targets."
  type        = string
  default     = null
}

variable "aws_lb_target_group_attachment_target_id_1" {
  description = "The ID of the target."
  type        = string
  default     = null
}

variable "aws_lb_target_group_attachment_target_id_2" {
  description = "The ID of the target."
  type        = string
  default     = null
}

variable "aws_lb_name" {
  description = "The name of the LB."
  type        = string
  default     = null
}

variable "aws_lb_internal" {
  description = "LB will be internal"
  type        = bool
  default     = false
}

variable "aws_lb_load_balancer_type" {
  description = "The type of load balancer to create. Possible values are application, gateway, or network."
  type        = string
  default     = "application"
}

variable "aws_lb_enable_deletion_protection" {
  description = "Deletion of the load balancer will be disabled via the AWS API."
  type        = bool
  default     = false
}

variable "aws_lb_access_logs_bucket" {
  description = "The S3 bucket name to store the logs in."
  type        = string
  default     = null
}

variable "aws_lb_access_logs_prefix" {
  description = "The S3 bucket prefix. Logs are stored in the root if not configured."
  type        = string
  default     = null
}

variable "aws_lb_access_logs_enabled" {
  description = "Boolean to enable / disable access_logs."
  type        = bool
  default     = false
}

variable "aws_lb_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "alb_security_group_name" {
  description = "Name of security group - not required if create_sg is false"
  type        = string
  default     = null
}

variable "alb_security_group_description" {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}

variable "alb_egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "alb_ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "alb_vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
  type        = string
  default     = null
}

variable "alb_ingress_from_port" {}

variable "alb_ingress_to_port" {}

variable "alb_ingress_protocol" {}

variable "alb_egress_from_port" {}

variable "alb_egress_to_port" {}

variable "alb_egress_protocol" {}

variable "alb_security_group_tags" {
  description = "A mapping of tags to assign to security group"
  type        = map(string)
  default     = {}
}