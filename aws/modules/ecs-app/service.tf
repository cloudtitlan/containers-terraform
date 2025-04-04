resource "aws_ecs_service" "service" {
  name            = var.component
  cluster         = var.app_name
  task_definition = aws_ecs_task_definition.definition.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
    security_groups  = [data.aws_ssm_parameter.app_sg_id.value]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "app"
    container_port   = var.port
  }
}
