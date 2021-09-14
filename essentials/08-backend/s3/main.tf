terraform {
    backend "s3" {
        bucket          =   "jhsong-terraform-s3-backend"
        key             =   "sre"
        region          =   "us-east-1"
        dynamodb_table  =   "jhsong-terraform-lock"
  }
}
provider "aws" {
    region          =   "us-east-1"
}

resource "aws_vpc" "main" {
    cidr_block      =   "10.0.0.0/16"

    tags = {
        Name        =   "sre"
        Managed_by  =   "terraform"
    }
}