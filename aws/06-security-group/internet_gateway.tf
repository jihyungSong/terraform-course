# Internet Gateway
resource "aws_internet_gateway" "vpc_igw" {
    vpc_id              =   aws_vpc.vpc.id

    tags = {
        Name            =   "${var.prefix}-igw"
        Managed_by      =   "terraform"
    }
}