terraform {}

provider "aws" {
    region          =   "<<YOUR_REGION>>"
}

provider "aws" {
    alias           =   "west"
    region          =   "us-west-2"
}


resource "aws_vpc" "east_main" {
    cidr_block      =   "10.0.0.0/16"

    tags = {
        Name        =   "<<VPC_NAME>>"
        Managed_by  =   "terraform"
    }
}

resource "aws_vpc" "west_main" {
    provider        =   aws.west
    cidr_block      =   "10.0.0.0/16"

    tags = {
        Name        =   "<<VPC_NAME>>"
        Managed_by  =   "terraform"
    }
}