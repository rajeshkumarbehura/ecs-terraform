data "template_file" "ops_stream_app" {
  template = file("./templates/ops_stream_app.json.tpl")

  vars = {
    app_image = var.ops_stream_image
    app_port = var.app_port
    fargate_cpu = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region = var.aws_region
    prefix = var.prefix
    container_name = var.ops_stream_container_name
  }
}


resource "aws_ecs_task_definition" "ops_stream_task_def" {
  family = "ops-stream-app-task"
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"]
  cpu = var.fargate_cpu
  memory = var.fargate_memory
  container_definitions = data.template_file.ops_stream_app.rendered
}


resource "aws_ecs_service" "ops_stream_main" {
  name = "ops-stream-service"
  cluster = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.ops_stream_task_def.arn
  desired_count = var.app_count
  launch_type = "FARGATE"

  network_configuration {
    security_groups = [
      aws_security_group.ecs_tasks.id]
    subnets = aws_subnet.public.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.ops_stream_target.id
    container_name = var.ops_stream_container_name
    container_port = var.app_port
  }

  depends_on = [
    aws_alb_listener.front_end_ops_stream,
    aws_iam_role_policy_attachment.ecs_task_execution_role]
}
