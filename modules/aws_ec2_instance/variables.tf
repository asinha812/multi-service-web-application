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

variable "ec2_instance_availability_zone" {
  description = "AZ to start the instance in."
  type        = string
  default     = null
}

variable "ec2_instance_subnet_id" {
  description = " VPC Subnet ID to launch in."
  type        = string
  default     = null
}

variable "ec2_instance_vpc_security_group_ids" {
  description = "List of security group names to associate with."
  type        = list(string)
  default     = []
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

variable "ec2_instance_tags" {
  description = "Map of tags assigned to the resource"
  type        = map(string)
  default     = null
}