resource "aws_instance" "this" {
    ami                             =   data.aws_ami.ubuntu.id
    subnet_id                       =   var.subnet_id
    instance_type                   =   var.instance_type
    key_name                        =   var.keypair_name
    vpc_security_group_ids          =   var.security_group_ids
    
    tags = {
        Name                        =   "${var.prefix}-instance"
        Managed_by                  =   "terraform"
    }
}