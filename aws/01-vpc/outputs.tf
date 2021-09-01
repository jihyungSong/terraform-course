output "vpc_id" {
    description     =   "The ID of VPC"
    value           =   aws_vpc.this.id
}

output "vpc_cidr_block" {
    description     =   "The CIDR IP Range Block of VPC"
    value           =   aws_vpc.this.cidr_block
}