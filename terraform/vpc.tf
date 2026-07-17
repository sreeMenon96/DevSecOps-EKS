resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  enable_dns_support = true

  enable_dns_hostnames = true

  tags = merge(
    local.common_tags, {

      Name = "${local.name_prefix}-vpc"

    }

  )

}

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags, {

      Name = "${local.name_prefix}-igw"

    }

  )

}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = data.aws_availability_zones.available.names[0]

  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags, {

      Name = "${local.name_prefix}-public-subnet-1"

      "kubernetes.io/role/elb" = "true"

      "kubernetes.io/cluster/${var.cluster_name}" = "shared"

    }

  )

}

resource "aws_subnet" "public_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = data.aws_availability_zones.available.names[1]

  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags, {

      Name = "${local.name_prefix}-public-subnet-2"

      "kubernetes.io/role/elb" = "true"

      "kubernetes.io/cluster/${var.cluster_name}" = "shared"

    }

  )

}

resource "aws_subnet" "private_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_1_cidr

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = merge(
    local.common_tags, {

      Name = "${local.name_prefix}-private-subnet-1"

      "kubernetes.io/role/internal-elb" = "true"

      "kubernetes.io/cluster/${var.cluster_name}" = "shared"

    }

  )

}

resource "aws_subnet" "private_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = merge(
    local.common_tags, {

      Name = "${local.name_prefix}-private-subnet-2"

      "kubernetes.io/role/internal-elb" = "true"

      "kubernetes.io/cluster/${var.cluster_name}" = "shared"

    }

  )

}