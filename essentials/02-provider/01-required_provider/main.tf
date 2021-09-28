terraform {
    required_providers {
        aws = {
            source  =   "hashicorp/aws"
            version =   "3.5"
            # version   =   ">= 3.6"
        }
    }
}

provider "aws" {
    region          =   "eu-west-1"
}

resource "aws_vpc" "main" {
    cidr_block      =   "10.0.0.0/16"

    tags = {
        Name        =   "ssuser-23"
        Managed_by  =   "terraform"
    }
}