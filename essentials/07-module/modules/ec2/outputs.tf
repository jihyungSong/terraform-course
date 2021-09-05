output "instance_id" {
    description =   "The ID of instance"
    value       =   aws_instance.this.id
}

output "instance_private_ip" {
    description =   "Private IP of instance"
    value       =   aws_instance.this.private_ip
}