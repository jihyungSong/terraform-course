resource "aws_launch_template" "web" {
    name                                =    "${var.prefix}-web"
    
    image_id                            =    var.image_id
    instance_type                       =    var.instance_type
    key_name                            =    var.keypair_name
    vpc_security_group_ids              =    var.security_group_ids

    block_device_mappings {
        device_name                     =   "/dev/sdb"

        ebs {
            snapshot_id                 =   var.data_vol_snapshot_id
            volume_size                 =   var.data_volume_size
            volume_type                 =   "gp3"
            delete_on_termination       =   true
        }
    }
  
    tag_specifications {
        resource_type = "instance"
        tags = {
            Name  = "${var.prefix}-instance"
        } 
    }
    
    user_data = filebase64("${path.module}/templates/userdata.sh")
}
