module "webserver" {
    source                  =   "./modules/ec2"
    
    prefix                  =   var.prefix
    subnet_ids              =   var.public_subnet_ids
    ami_id                  =   var.ami_id
    keypair_name            =   var.keypair_name
    instance_type           =   var.instance_type
    security_groups         =   var.security_group_ids
    iam_profile_name        =   var.iam_profile_name
}
