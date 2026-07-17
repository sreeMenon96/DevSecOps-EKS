variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}


variable "log_retention_days" {
  description = "CloudWatch Log Retention"
  type        = number
  default     = 30
}

variable "cluster_name" {
  description = "Amazon EKS Cluster Name"
  type        = string
  default     = "devsecops-eks"
}

variable "kubernetes_version" {
  description = "Kubernetes Version"
  type        = string
  default     = "1.32"
}

variable "node_group_name" {
  type    = string
  default = "worker-group"
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 3
}

variable "min_size" {
  type    = number
  default = 2
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "cluster_log_types" {
  description = "EKS Control Plane Log Types"
  type        = list(string)
  default     = ["api", "audit", "authenticator"]
}