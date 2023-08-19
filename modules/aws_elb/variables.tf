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

variable "aws_lb_target_group_vpc_id" {
  description = "Identifier of the VPC in which to create the target group"
  type        = string
  default     = null
}

variable "aws_lb_target_group_attachment_target_id_1" {
  description = "The ID of the target."
  type = string
  default = null
}

variable "aws_lb_target_group_attachment_target_id_2" {
  description = "The ID of the target."
  type = string
  default = null
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

variable "aws_lb_security_groups" {
  description = "A list of security group IDs to assign to the LB."
  type        = list(string)
  default     = []
}

variable "aws_lb_subnets" {
  description = "A list of subnet IDs to attach to the LB"
  type        = list(string)
  default     = []
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