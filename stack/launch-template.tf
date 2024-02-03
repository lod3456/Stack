resource "aws_launch_template" "ecs_instance_template" {
  name_prefix   = "ecs-instance-"
  image_id      = "ami-123456" # Replace this with the actual AMI ID for ECS
  instance_type = "m4.large"
  key_name      = "your-key-name" # Optional: Specify your key name

  user_data = base64encode(<<-EOF
              #!/bin/bash
              echo ECS_CLUSTER=${aws_ecs_cluster.ecs_cluster.name} >> /etc/ecs/ecs.config
              EOF
              )

  lifecycle {
    create_before_destroy = true
  }
}
