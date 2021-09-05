output "instance_id" {
    description =   "The ID of instance"
    value       =   module.instance.instance_id
}

output "instance_private_ip" {
    description =   "Private IP of instance"
    value       =   module.instance.instance_private_ip
}
