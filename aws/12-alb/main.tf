module "vpc" {
    source                  =   "./modules/vpc"

    prefix                  =   var.prefix
    vpc_cidr                =   var.vpc_cidr
    
    public_subnets          =   var.public_subnets
    private_subnets         =   var.private_subnets
    
    admin_access_cidrs      =   var.admin_access_cidrs
}

module "webserver" {
    source                   =   "./modules/ec2"
    
    prefix                  =   var.prefix
    subnet_ids              =   module.vpc.private_subnet_ids
    ami_id                  =   var.ami_id
    data_vol_snapshot_id    =   var.data_vol_snapshot_id
    data_volume_size        =   var.data_volume_size
    keypair_name            =   var.keypair_name
    instance_type           =   var.instance_type
    security_groups         =   [module.vpc.web_security_group_id]
}

module "load_balancer" {
    source                  =   "./modules/alb"
    
    prefix                  =   var.prefix
    vpc_id                  =   module.vpc.this_vpc_id
    port                    =   var.port
    protocol                =   var.protocol

    security_group_ids      =   [module.vpc.alb_security_group_id]
    subnet_ids              =   module.vpc.public_subnet_ids
    webserver_ids           =   module.webserver.webserver_instances_ids
}