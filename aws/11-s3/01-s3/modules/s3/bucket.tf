resource "aws_s3_bucket" "this" {
    bucket    =   "${var.prefix}-bucket"
    acl       =   "public-read"

  
    tags = {
        Name                        =   "${var.prefix}-bucket"
        Managed_by                  =   "terraform"
    }
}