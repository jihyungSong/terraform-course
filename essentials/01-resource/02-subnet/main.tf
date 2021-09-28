terraform {}

provider "aws" {
    region          =   "<<YOUR_REGION>>"
}

resource "aws_vpc" "main" {
    cidr_block          =   "10.0.0.0/16"

    tags = {
        Name            =   "<<YOUR_USER_NAME>>"
        Managed_by      =   "terraform"
    }
}

resource "aws_subnet" "this" {
    vpc_id              =   aws_vpc.main.id
    cidr_block          =   "10.0.1.0/24"
    availability_zone   =   "<<AZ_NAME>>"

    tags = {
        Name            =   "<<YOUR_USER_NAME>>"
        Managed_by      =   "terraform"
    }
}