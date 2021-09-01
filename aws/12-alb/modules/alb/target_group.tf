resource "aws_lb_target_group" "web" {
    name            =   "${var.prefix}-target-group"   
    port            =   var.port
    protocol        =   var.protocol
    vpc_id          =   var.vpc_id
    target_type     =   "instance"
}

resource "aws_lb_target_group_attachment" "web" {
    count               =   length(var.webserver_ids)
    
    target_group_arn    =   aws_lb_target_group.web.arn
    target_id           =   "${var.webserver_ids[count.index]}"
    port                =   var.port
}
