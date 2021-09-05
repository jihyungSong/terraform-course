output "vpc_id" {
    description =   "The ID of VPC"
    value       =   aws_vpc.this.id
}

output "subnet_id" {
    description =   "The ID of Subnet"
    value       =   aws_subnet.this.id
}

output "default_security_group_id" {
    description =   "The ID of Security Group"
    value       =   aws_vpc.this.default_security_group_id
}