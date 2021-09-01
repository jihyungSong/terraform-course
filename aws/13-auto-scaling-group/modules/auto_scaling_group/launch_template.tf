resource "aws_launch_template" "web" {
    name                    =    "${var.prefix}-web"
    
    image_id                =    var.image_id
    instance_type           =    var.instance_type
    key_name                =    var.keypair_name
    vpc_security_group_ids  =    var.security_group_ids

    tag_specifications {
        resource_type = "instance"
        tags = {
            Name  = "${var.prefix}-instance"
        } 
    }
    
    user_data = filebase64("${path.module}/templates/userdata.sh")
}
