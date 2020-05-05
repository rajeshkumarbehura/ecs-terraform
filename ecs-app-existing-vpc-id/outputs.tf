# outputs.tf

output "ops_reader_alb_hostname" {
  value = aws_alb.ops_reader_lb.dns_name
}

