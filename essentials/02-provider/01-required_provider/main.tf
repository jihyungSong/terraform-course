terraform {
    required_providers {
        aws = {
            source  =   "hashicorp/aws"
            version =   "4.11"
            # version   =   ">= 4.12"
        }
    }
}

provider "aws" {
    region          =   "<<YOUR_REGION>>"
}

resource "aws_vpc" "main" {
    cidr_block      =   "10.0.0.0/16"

    tags = {
        Name        =   "<<YOUR_USER_NAME>>"
        Managed_by  =   "terraform"
    }
}