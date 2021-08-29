output "target_group_id" {
    value    =    aws_lb_target_group.target_group.id
}

output "target_group_arn" {
    value    =    aws_lb_target_group.target_group.arn
}

output "alb_arn" {
    value    =    aws_lb.alb.arn
}

output "alb_name" {
    value    =    aws_lb.alb.name
}

output "alb_dns_name" {
    value    =    aws_lb.alb.dns_name
}
