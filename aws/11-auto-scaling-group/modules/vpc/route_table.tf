# Route table (Public)
resource "aws_route_table" "public" {
    vpc_id              =   aws_vpc.this.id

    tags = {
        Name            =   "${var.prefix}-public-rt"
        Managed_by      =   "terraform"
    }
}

# Route table (Private)
resource "aws_route_table" "private" {
    vpc_id              =   aws_vpc.this.id

    tags = {
        Name            =   "${var.prefix}-private-rt"
        Managed_by      =   "terraform"
    }
}

# Add route to go to the Internet Gateway for public
resource "aws_route" "internet_gateway" {
    route_table_id             =    aws_route_table.public.id
    destination_cidr_block     =    "0.0.0.0/0"
    gateway_id                 =    aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
    count               =   length(var.public_subnets)
    
    subnet_id           =   "${aws_subnet.public[count.index].id}"
    route_table_id      =   aws_route_table.public.id
    
    depends_on          =   [aws_subnet.public]
}

resource "aws_route_table_association" "private" {
    count               =   length(var.public_subnets)
    
    subnet_id           =   "${aws_subnet.private[count.index].id}"
    route_table_id      =   aws_route_table.private.id
    
    depends_on          =   [aws_subnet.private]
}