resource "aws_autoscaling_group" "auto_scaling_group" {
    name                         =    "${var.prefix}-asg"
    vpc_zone_identifier          =    var.subnet_ids
    max_size                     =    var.max_size	
    min_size                     =    var.min_size
    desired_capacity             =    var.desired_capacity
    target_group_arns            =    var.target_group_arns

    health_check_type            =    var.health_check_type
    health_check_grace_period    =    var.health_check_grace_period

    launch_template {
        id         =     aws_launch_template.launch_template.id
        version    =     "$Default"
    }
}