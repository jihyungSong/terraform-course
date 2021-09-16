module "vpc" {
    source                  =   "./modules/vpc"

    prefix                  =   var.prefix
    vpc_cidr                =   var.vpc_cidr
    
    public_subnets          =   var.public_subnets
    private_subnets         =   var.private_subnets
    
    admin_access_cidrs      =   var.admin_access_cidrs
}

module "iam" {
    source                  =   "./modules/iam"
    prefix                  =   var.prefix
}

module "efs" {
    source                  =   "./modules/efs"
    
    prefix                  =   var.prefix
    subnet_ids              =   module.vpc.public_subnet_ids
    security_groups         =   [module.vpc.efs_security_group_id]
}
