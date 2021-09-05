terraform {}

provider "aws" {
    region          =   var.region
}

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

resource "aws_instance" "test" {
    ami                             =   data.aws_ami.ubuntu.id
    subnet_id                       =   aws_subnet.this.id
    instance_type                   =   var.instance_type
    key_name                        =   var.keypair_name
    vpc_security_group_ids          =   [aws_vpc.this.default_security_group_id]

    tags = {
        Name                        =   "${var.prefix}-instance"
        Managed_by                  =   "terraform"
    }
}