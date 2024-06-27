
output "ec2-public-ip" {
  description = "ec2-public-ip"
  value       = aws_instance.aws-instance.public_ip
}