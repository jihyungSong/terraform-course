# EIP
resource "aws_eip" "nat_gw_eip" {
  vpc               =   true

  depends_on        =   [aws_internet_gateway.vpc_igw]
}

# NAT Gateway
resource "aws_nat_gateway" "vpc_nat_gw" {
  allocation_id     =   aws_eip.nat_gw_eip.id
  subnet_id         =   aws_subnet.public_subnet[0].id

  tags = {
    Name            =   "${var.prefix}-nat-gw"
  }

  depends_on        =   [aws_internet_gateway.vpc_igw]
}
