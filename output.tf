output "ec2_public_ip" {
  value = aws_instance.my-ec2-instance[0].public_ip
  description = "value of the public IP address of the EC2 instance"
}

output "private_dns_name" {
  value = aws_instance.my-ec2-instance[0].private_dns
  description = "value of the private DNS name of the EC2 instance"
}

output "arn_name" {
  value = aws_instance.my-ec2-instance[0].arn
  description = "value of the ARN of the EC2 instance"
}

output "ect_host_id" {
  value = aws_instance.my-ec2-instance[0].id
  description = "value of the ID of the EC2 instance"
}