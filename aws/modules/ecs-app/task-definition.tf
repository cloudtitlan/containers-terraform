resource "aws_ecs_task_definition" "definition" {
  family             = "${var.app_name}-${var.component}"
  execution_role_arn = "arn:aws:iam::911679516338:role/ecsTaskExecutionRole"
  container_definitions = jsonencode([{
    name      = "app"
    image     = "${data.aws_ssm_parameter.ecr_repo_url.value}:${var.image_tag}"
    essential = true
    portMappings = [{
      containerPort = var.port
      protocol      = "tcp"
    }]
    environment = var.environment_variables
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = aws_cloudwatch_log_group.logs.name
        "awslogs-region"        = var.region
        "awslogs-stream-prefix" = "ecs"
      }
    }
  }])
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
}

resource "aws_cloudwatch_log_group" "logs" {
  name = "/ecs/${var.app_name}-${var.component}"
}
