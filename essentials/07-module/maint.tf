terraform {}

provider "aws" {
    region              =   var.region
}

module "vpc" {
    source              =   "./modules/vpc"

    prefix              =   var.prefix
}

module "instance" {
    source              =   "./modules/ec2"
    
    prefix              =   var.prefix
    subnet_id           =   module.vpc.subnet_id
    keypair_name        =   var.keypair_name
    instance_type       =   var.instance_type
    security_group_ids  =   [module.vpc.default_security_group_id]
}