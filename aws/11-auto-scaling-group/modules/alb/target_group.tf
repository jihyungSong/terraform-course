resource "aws_lb_target_group" "web" {
    name            =   "${var.prefix}-target-group"   
    port            =   var.port
    protocol        =   var.protocol
    vpc_id          =   var.vpc_id
    target_type     =   "instance"
}
