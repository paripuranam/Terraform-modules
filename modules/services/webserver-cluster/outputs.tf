output "DNS_name" {
  value = aws_lb.lb-1.dns_name
  description = "My asg dns name"
}

output "security_group_id" {
  value = aws_security_group.my.id
  description = "ID of security group"
}