resource "aws_vpc" "this" {
    cidr_block      =   "10.0.0.0/16"

    tags = {
        Name        =   "${var.prefix}-vpc"
        Managed_by  =   "terraform"
    }
}

resource "aws_subnet" "this" {
    vpc_id              =   aws_vpc.this.id
    cidr_block          =   "10.0.1.0/24"
    availability_zone   =   data.aws_availability_zones.available.names[0]

    tags = {
        Name        =   "${var.prefix}-subnet"
        Managed_by  =   "terraform"
    }
}
