# logs.tf
# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "ops_reader_log_group" {
  name              = "/ecs/ops-reader-app"
  retention_in_days = 30

  tags = {
    Name = "ops-reader-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "cb_log_stream" {
  name           = "ops-reader-log-stream"
  log_group_name = aws_cloudwatch_log_group.ops_reader_log_group.name
}
