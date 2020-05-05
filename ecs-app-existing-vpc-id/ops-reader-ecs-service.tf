data "template_file" "ops_reader_app" {
  template = file("./templates/ops_reader_app.json.tpl")

  vars = {
    app_image = var.ops_reader_image
    app_port = var.app_port
    fargate_cpu = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region = var.aws_region
    prefix = var.prefix
    container_name = var.ops_reader_container_name
  }
}


resource "aws_ecs_task_definition" "ops_reader_task_def" {
  family = "ops-reader-app-task"
  execution_role_arn = aws_iam_role.ops_reader_ecs_task_execution_role.arn
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"]
  cpu = var.fargate_cpu
  memory = var.fargate_memory
  container_definitions = data.template_file.ops_reader_app.rendered
}


resource "aws_ecs_service" "ops_reader_main" {
  name = "ops-reader-service"
  cluster = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.ops_reader_task_def.arn
  desired_count = var.app_count
  launch_type = "FARGATE"

  network_configuration {
    security_groups = [
      aws_security_group.ecs_tasks.id]
    subnets = ["subnet-04b8d6399d6d9112a","subnet-043b7e999d33eaf3f"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.ops_reader_target.id
    container_name = var.ops_reader_container_name
    container_port = var.app_port
  }

  depends_on = [
    aws_alb_listener.front_end_ops_reader,
    aws_iam_role_policy_attachment.ecs_task_execution_role]
}
