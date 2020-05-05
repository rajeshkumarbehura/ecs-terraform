# outputs.tf

output "ops_stream_alb_hostname" {
  value = aws_alb.ops_stream_lb.dns_name
}
