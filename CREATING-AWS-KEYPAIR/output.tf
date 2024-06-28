
output "key-pair-name" { #It outputs the key pair name
  description = "ec2-public-ip"
  value       = aws_key_pair.key-pair.key_name
}