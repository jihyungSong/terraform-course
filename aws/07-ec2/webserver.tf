resource "aws_instance" "webserver" {
    associate_public_ip_address     =   true
    ami                             =   data.aws_ami.ubuntu.id
    subnet_id                       =   element(var.subnet_ids, count.index)
    instance_type                   =   var.instance_type
    key_name                        =   var.keypair_name
    security_groups                 =   var.security_groups

    user_data                       =   data.template_file.webserver_init.rendered

    tags = {
        Name                        =   "${var.prefix}-webserver-${count.index}"
        Managed_by                  =   "terraform"
    }
    
    count                           =   length(var.subnet_ids)
}