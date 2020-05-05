# outputs.tf

output "alb_hostname_1" {
  value = aws_alb.main1.dns_name
}
output "alb_hostname_2" {
  value = aws_alb.main2.dns_name
}

