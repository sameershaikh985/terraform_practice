output "instance_public_ip" {
  value       = aws_instance.my_instance.public_ip                                          # The actual value to be outputted
  description = "The public IP address of the EC2 instance" # Description of what this output represents
}

output "instance_public_dns" {
  value = aws_instance.my_instance.public_dns
}