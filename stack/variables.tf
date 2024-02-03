variable "region" {
  description = "AWS region to deploy the resources"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Desired number of instances in the ECS cluster"
  default     = 3
}

variable "max_size" {
  description = "Maximum number of instances in the ECS cluster"
  default     = 15
}

variable "min_size" {
  description = "Minimum number of instances in the ECS cluster"
  default     = 3
}
