resource "aws_instance" "webserver" {
    count                           =   length(var.subnet_ids)
    
    associate_public_ip_address     =   true
    ami                             =   var.ami_id
    subnet_id                       =   element(var.subnet_ids, count.index)
    instance_type                   =   var.instance_type
    key_name                        =   var.keypair_name
    vpc_security_group_ids          =   var.security_groups
    user_data                       =   data.template_file.webserver_init.rendered

    ebs_block_device {
        device_name                 =   "/dev/sdb"
        volume_type                 =   "gp3"
        snapshot_id                 =   var.data_vol_snapshot_id
        volume_size                 =   var.data_volume_size
        delete_on_termination       =   true
    }
  
    tags = {
        Name                        =   "${var.prefix}-webserver-${count.index}"
        Managed_by                  =   "terraform"
    }
}