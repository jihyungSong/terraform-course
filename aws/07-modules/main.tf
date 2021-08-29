module "vpc" {
    source              =   "./modules/vpc"

    prefix              =   var.prefix
    vpc_cidr            =   var.vpc_cidr
    
    public_subnets      =   var.public_subnets
    private_subnets     =   var.private_subnets
    
    admin_access_cidrs  =   var.admin_access_cidrs
}
