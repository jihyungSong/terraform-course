# EIP
resource "aws_eip" "this" {
  vpc               =   true

  depends_on        =   [aws_internet_gateway.this]
}

# NAT Gateway
resource "aws_nat_gateway" "this" {
  allocation_id     =   aws_eip.this.id
  subnet_id         =   aws_subnet.public[0].id

  tags = {
    Name            =   "${var.prefix}-nat-gw"
  }

  depends_on        =   [aws_internet_gateway.this]
}
