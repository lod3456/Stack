output "ecs_cluster_arn" {
  value = aws_ecs_cluster.ecs_cluster.arn
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.ecs_asg.name
}
