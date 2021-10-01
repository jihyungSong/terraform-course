module "vpc" {
    source              =   "./modules/vpc"

    prefix              =   var.prefix
    vpc_cidr            =   var.vpc_cidr
    
    public_subnets      =   var.public_subnets
    private_subnets     =   var.private_subnets
    
    admin_access_cidrs  =   var.admin_access_cidrs
}

module "webserver" {
    source              =   "./modules/ec2"
    
    prefix              =   var.prefix
    subnet_ids          =   module.vpc.public_subnet_ids
    keypair_name        =   var.keypair_name
    instance_type       =   var.instance_type
    security_groups     =   [module.vpc.web_security_group_id, module.vpc.admin_security_group_id]
}