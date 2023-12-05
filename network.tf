provider "aws" {
  region     = var.aws_region
}

data "aws_availability_zones" "available" {
  state = "available"
}


# NETWORKING #
resource "aws_vpc" "app" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags                 = local.common_tags
}

resource "aws_internet_gateway" "app" {
  vpc_id = aws_vpc.app.id
  tags   = local.common_tags
}

# SUBNETS #

resource "aws_subnet" "public_subnet1" {
  cidr_block              = var.vpc_public_subnets_cidr_block[0]
  vpc_id                  = aws_vpc.app.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags                    = local.common_tags
}


# ROUTING #
resource "aws_route_table" "app" {
  vpc_id = aws_vpc.app.id
  tags   = local.common_tags
  route {
    cidr_block = var.route_table_default_cidr
    gateway_id = aws_internet_gateway.app.id
  }
}

resource "aws_route_table_association" "app_subnet1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.app.id
}

# SECURITY GROUPS #
resource "aws_security_group" "app_sg" {
  name   = var.security_group_name
  vpc_id = aws_vpc.app.id

  # HTTP access to NGINX from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



