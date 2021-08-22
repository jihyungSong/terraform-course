terraform {}

provider "aws" {
    region = "us-east-1"
}

provider "aws" {
    alias  = "west"
    region = "us-west-2"
}


resource "aws_vpc" "east_main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "ssuser01-vpc-east-1"
        Managed_by = "terraform"
    }
}

resource "aws_vpc" "west_main" {
    provider   = aws.west
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "ssuser01-vpc-west-2"
        Managed_by = "terraform"
    }
}