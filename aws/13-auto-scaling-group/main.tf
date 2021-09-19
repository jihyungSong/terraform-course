module "vpc" {
    source                  =   "./modules/vpc"

    prefix                  =   var.prefix
    vpc_cidr                =   var.vpc_cidr
    
    public_subnets          =   var.public_subnets
    private_subnets         =   var.private_subnets
    
    admin_access_cidrs      =   var.admin_access_cidrs
}

module "load_balancer" {
    source                  =   "./modules/alb"
    
    prefix                  =   var.prefix
    vpc_id                  =   module.vpc.this_vpc_id
    port                    =   var.port
    protocol                =   var.protocol

    security_group_ids      =   [module.vpc.alb_security_group_id]
    subnet_ids              =   module.vpc.public_subnet_ids
    
    depends_on              =   [module.vpc]
}

module  "auto_scaling_group" {
    source                  =   "./modules/auto_scaling_group"
    
    prefix                  =   var.prefix

    image_id                =   var.image_id
    instance_type           =   var.instance_type
    keypair_name            =   var.keypair_name
    data_vol_snapshot_id    =   var.data_vol_snapshot_id
    data_volume_size        =   var.data_volume_size

    security_group_ids      =   [module.vpc.web_security_group_id]
    subnet_ids              =   module.vpc.private_subnet_ids
    target_group_arns       =   [module.load_balancer.web_target_group_arn]
    
    max_size                =   var.max_size
    min_size                =   var.min_size
    desired_capacity        =   var.desired_capacity
    
    depends_on              =   [module.vpc, module.load_balancer]
}
