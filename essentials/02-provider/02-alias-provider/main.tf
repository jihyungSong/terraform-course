terraform {}

provider "aws" {
    region          =   "<<YOUR_REGION>>"
}

provider "aws" {
    alias           =   "<<OTHER_REGION_ALIAS>>"
    region          =   "<<OTHER_REGION>>"
}


resource "aws_vpc" "main" {
    cidr_block      =   "10.0.0.0/16"

    tags = {
        Name        =   "<<VPC_NAME>>"
        Managed_by  =   "terraform"
    }
}

resource "aws_vpc" "other_region_vpc_main" {
    provider        =   aws.<<OTHER_REGION_ALIAS>>
    cidr_block      =   "10.0.0.0/16"

    tags = {
        Name        =   "<<VPC_NAME>>"
        Managed_by  =   "terraform"
    }
}