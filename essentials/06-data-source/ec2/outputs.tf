output "instance_id" {
    description =   "The ID of instance"
    value       =   aws_instance.test.id
}

output "instance_private_ip" {
    description =   "Private IP of instance"
    value       =   aws_instance.test.private_ip
}