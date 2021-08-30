# ALB
resource "aws_lb" "web" {
  name               = "${var.prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  tags = {
    Managed_by = "Terraform"
  }
}