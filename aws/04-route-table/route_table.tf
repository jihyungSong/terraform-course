# Route table (Public)
resource "aws_route_table" "vpc_public_rt" {
    vpc_id              =   aws_vpc.vpc.id

    tags = {
        Name            =   "${var.prefix}-public-rt"
        Managed_by      =   "terraform"
    }
}

# Route table (Private)
resource "aws_route_table" "vpc_private_rt" {
    vpc_id              =   aws_vpc.vpc.id

    tags = {
        Name            =   "${var.prefix}-private-rt"
        Managed_by      =   "terraform"
    }
}

# Add route to go to the Internet Gateway for public
resource "aws_route" "internet_gateway_route" {
    route_table_id             =    aws_route_table.vpc_public_rt.id
    destination_cidr_block     =    "0.0.0.0/0"
    gateway_id                 =    aws_internet_gateway.vpc_igw.id
}

resource "aws_route_table_association" "public_rt_assoc" {
    subnet_id         =   "${aws_subnet.public_subnet[count.index].id}"
    route_table_id    =   aws_route_table.vpc_public_rt.id
  
    count             =   length(var.public_subnets)
}

resource "aws_route_table_association" "private_rt_assoc" {
    subnet_id         =   "${aws_subnet.private_subnet[count.index].id}"
    route_table_id    =   aws_route_table.vpc_private_rt.id
  
    count             =   length(var.public_subnets)
}