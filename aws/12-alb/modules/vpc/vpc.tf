# VPC
resource "aws_vpc" "this" {
    cidr_block      =   var.vpc_cidr

    tags = {
        Name        =   "${var.prefix}-vpc"
        Managed_by  =   "terraform"
    }
}
