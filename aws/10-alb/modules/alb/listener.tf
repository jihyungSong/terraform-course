resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.web.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}