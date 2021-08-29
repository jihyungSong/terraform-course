resource "aws_launch_template" "launch_template" {
    name                    =    "${var.prefix}-launch-template"
    
    image_id                =    var.image_id
    instance_type           =    var.instance_type
    key_name                =    var.keypair_name
    vpc_security_group_ids  =    var.security_group_ids

    iam_instance_profile {
        arn = var.iam_instance_profile_arn
    }

    tag_specifications {
        resource_type = "instance"
        tags = {
            Name  = "${var.prefix}-instance"
        } 
    }
    
    user_data = file("${path.module}/templates/userdata.sh")
}
