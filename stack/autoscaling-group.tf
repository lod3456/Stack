resource "aws_autoscaling_group" "ecs_asg" {
  name_prefix = "ecs-asg-"
  min_size    = 3
  max_size    = 15
  desired_capacity = 3

  launch_template {
    id      = aws_launch_template.ecs_instance_template.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.vpc_subnets

  tag {
    key                 = "Name"
    value               = "ECS Instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "ecs-scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ecs_asg.name

  policy_type = "SimpleScaling"
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "ecs-scale-in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ecs_asg.name

  policy_type = "SimpleScaling"
}
