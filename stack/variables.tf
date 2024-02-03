variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "my-ecs-cluster"
}

variable "alb_subnets" {
  description = "Subnets for the ALB"
  type        = list(string)
}

variable "vpc_subnets" {
  description = "List of VPC subnet IDs for the ECS instances"
  type        = list(string)
}

