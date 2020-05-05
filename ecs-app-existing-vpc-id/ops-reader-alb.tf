# alb.tf
resource "aws_alb" "ops_reader_lb" {
  name            = "ops-reader"
  subnets         = ["subnet-04b8d6399d6d9112a","subnet-043b7e999d33eaf3f"]
  security_groups = [aws_security_group.lb.id]
}

resource "aws_alb_target_group" "ops_reader_target" {
  name        = "ops-reader-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      =  "vpc-088b4045d9afc02bb"
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = var.ops_reader_health_check_path
    unhealthy_threshold = "2"
  }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "front_end_ops_reader" {
  load_balancer_arn = aws_alb.ops_reader_lb.id
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.ops_reader_target.id
    type             = "forward"
  }
}

