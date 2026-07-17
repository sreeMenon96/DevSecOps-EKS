resource "aws_security_group" "eks_cluster" {

  name = "${local.name_prefix}-eks-cluster-sg"

  description = "Security group for EKS Control Plane"

  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags, {

      Name = "${local.name_prefix}-eks-cluster-sg"

    }

  )

}

resource "aws_security_group" "eks_nodes" {

  name = "${local.name_prefix}-eks-node-sg"

  description = "Security group for EKS Worker Nodes"

  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags, {

      Name = "${local.name_prefix}-eks-node-sg"

    }

  )

}

resource "aws_security_group" "alb" {

  name = "${local.name_prefix}-alb-sg"

  description = "Application Load Balancer"

  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags, {

      Name = "${local.name_prefix}-alb-sg"

    }

  )

}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {

  security_group_id = aws_security_group.alb.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 80

  to_port = 80

  ip_protocol = "tcp"

}

resource "aws_vpc_security_group_ingress_rule" "alb_https" {

  security_group_id = aws_security_group.alb.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 443

  to_port = 443

  ip_protocol = "tcp"

}

resource "aws_vpc_security_group_egress_rule" "cluster_outbound" {

  security_group_id = aws_security_group.eks_cluster.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"

}

resource "aws_vpc_security_group_egress_rule" "node_outbound" {

  security_group_id = aws_security_group.eks_nodes.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"

}

resource "aws_vpc_security_group_egress_rule" "alb_outbound" {

  security_group_id = aws_security_group.alb.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"

}

resource "aws_vpc_security_group_ingress_rule" "nodes_from_cluster" {

  security_group_id = aws_security_group.eks_nodes.id

  referenced_security_group_id = aws_security_group.eks_cluster.id

  from_port = 1025

  to_port = 65535

  ip_protocol = "tcp"

}

resource "aws_vpc_security_group_ingress_rule" "node_to_node" {

  security_group_id = aws_security_group.eks_nodes.id

  referenced_security_group_id = aws_security_group.eks_nodes.id

  ip_protocol = "-1"

}

resource "aws_vpc_security_group_ingress_rule" "cluster_from_nodes" {

  security_group_id = aws_security_group.eks_cluster.id

  referenced_security_group_id = aws_security_group.eks_nodes.id

  from_port = 443

  to_port = 443

  ip_protocol = "tcp"

}