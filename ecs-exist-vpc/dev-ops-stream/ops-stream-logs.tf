# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "ops_stream_log_group" {
  name              = "/ecs/ops-stream-app"
  retention_in_days = 30

  tags = {
    Name = "ops-stream-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "ops_stream_log_stream" {
  name           = "ops-stream-log-stream"
  log_group_name = aws_cloudwatch_log_group.ops_stream_log_group.name
}
