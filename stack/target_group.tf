resource "aws_lb_target_group" "ecs_tg" {
  name     = "ecs-tg-${var.ecs_cluster_name}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "ECS TG - ${var.ecs_cluster_name}"
  }
}
