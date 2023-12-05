variable "aws_region" {
  type        = string
  description = "AWS region to use"
  default     = "eu-west-1"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block to use for deploying"
  default     = "10.219.60.0/22"
}

variable "vpc_public_subnets_cidr_block" {
  type        = list(string)
  description = "CIDR blocks for public subnets in the VPC"
  default     = ["10.219.60.0/24"]
}

variable "security_group_name" {
  type = string
  description = "Name of the security Group"
  default = "appsg"
}

variable "route_table_default_cidr" {
  type        = string
  description = "Default value for route table"
  default     = "0.0.0.0/0"
}

variable "aws_instance_sizes" {
  type        = map(string)
  description = "Instance sizes to use in AWS"
  default = {
    small  = "t3.micro"
    smallplus = "t3.small"
    medium = "m4.large"
    large  = "m4.xlarge"
  }
}
