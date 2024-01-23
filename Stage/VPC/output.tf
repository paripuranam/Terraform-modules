output "vpc_id" {
  value = aws_vpc.stage_vpc.id
}

output "subnet_id" {
  value = aws_subnet.subnet_1.id
}

output "sg_id" {
  value = aws_security_group.stage_security_group.id 
}