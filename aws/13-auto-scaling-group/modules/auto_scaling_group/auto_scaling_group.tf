resource "aws_autoscaling_group" "web" {
    name                         =    "${var.prefix}-web"
    vpc_zone_identifier          =    var.subnet_ids
    max_size                     =    var.max_size	
    min_size                     =    var.min_size
    desired_capacity             =    var.desired_capacity
    target_group_arns            =    var.target_group_arns

    health_check_type            =    "ELB"

    launch_template {
        id         =     aws_launch_template.web.id
        version    =     "$Default"
    }
}