output "web_auto_scaling_group_id" {
    description     =   "The ID of Auto Scaling Group"
    value           =   aws_autoscaling_group.web.id
}

output "web_launch_template_id" {
    description     =   "The ID of Launch Template"
    value           =   aws_launch_template.web.id
}
