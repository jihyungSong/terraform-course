output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "vpc_cidr" {
    value = aws_vpc.vpc.cidr_block
}

output "public_subnet_ids" {
    value = aws_subnet.public_subnet.*.id
}

output "private_subnet_ids" {
    value = aws_subnet.private_subnet.*.id
}

output "internet_gateway_id" {
    value = aws_internet_gateway.vpc_igw.id
}

output "public_route_table_id" {
    value = aws_route_table.vpc_public_rt.id
}

output "private_route_table_id" {
    value = aws_route_table.vpc_private_rt.id
}

output "nat_gateway_id" {
    value = aws_nat_gateway.vpc_nat_gw.id
}
