output "vpc_id" {
    description     =   "The ID of VPC"
    value           =   module.vpc.this_vpc_id
}

output "vpc_cidr_block" {
    description     =   "The CIDR IP Range Block of VPC"
    value           =   module.vpc.this_vpc_cidr_block
}

output "public_subnet_ids" {
    description     =   "The List of Public Subnet ID of VPC"
    value           =   module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
    description     =   "The List of Private Subnet ID of VPC"
    value           =   module.vpc.private_subnet_ids
}


output "admin_security_group_id" {
    description     =   "The ID of Security Group for Admin access"
    value           =   module.vpc.admin_security_group_id
}

output "web_security_group_id" {
    description     =   "The ID of Security Group for Web(HTTP) access"
    value           =   module.vpc.web_security_group_id
}