resource "aws_lb_target_group" "tg" {
  name        = var.component
  port        = var.port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value
  health_check {
    path = "/"
  }
}

resource "aws_lb_listener_rule" "ecs" {
  listener_arn = data.aws_ssm_parameter.listener_arn.value
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  condition {
    path_pattern {
      values = [var.path_rule]
    }
  }
}
