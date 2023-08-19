output "ec2_instances_ip" {
  value = aws_instance.ec2_instances.private_ip
}

output "ec2_instance_id" {
    value = aws_instance.ec2_instances.id
}