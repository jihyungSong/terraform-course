terraform {}

provider "aws" {
    region          =   "<<REGION_NAME>>"
}

resource "aws_vpc" "main" {
    cidr_block      =   "10.0.0.0/16"

    tags = {
        Name        =   "<<VPC_NAME>>"
        Managed_by  =   "terraform"
    }
}