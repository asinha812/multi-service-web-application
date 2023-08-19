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