variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = null
}

variable "security_group_name" {
  description = "Name of security group - not required if create_sg is false"
  type        = string
  default     = ""
}

variable "security_group_description" {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}

variable "security_group_tags" {
  description = "A mapping of tags to assign to security group"
  type        = map(string)
  default     = {}
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_from_port" {}

variable "egress_to_port" {}

variable "egress_protocol" {}

variable "ingess_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingess_from_port" {}

variable "ingress_to_port" {}

variable "ingress_protocol" {}