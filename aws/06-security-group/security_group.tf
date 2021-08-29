# Security Group for SSH
resource "aws_security_group" "admin" {
  name                  =   "${var.prefix}-admin-sg"
  vpc_id                =   aws_vpc.this.id

  # Outbound ALL
  egress {
    from_port           =   0
    to_port             =   0
    protocol            =   "-1"
    cidr_blocks         =   ["0.0.0.0/0"]
  }

  tags = {
    Name                =   "${var.prefix}-admin-sg"
    Managed_by          =   "terraform"
  }
}

resource "aws_security_group_rule" "admin_access_ingress" {
  description           =   "Allow SSH for admin"
  cidr_blocks           =   var.admin_access_cidrs
  from_port             =   22
  to_port               =   22
  protocol              =   "tcp"
  security_group_id     =   aws_security_group.admin.id
  type                  =   "ingress"
}

# Security Group for Web
resource "aws_security_group" "web" {
  name                  =   "${var.prefix}-web-sg"
  vpc_id                =   aws_vpc.this.id

  # Outbound ALL
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.prefix}-web-sg"
    Managed_by  = "terraform"
  }
}

resource "aws_security_group_rule" "http_access_ingress" {
  description           =   "Allow HTTP"
  cidr_blocks           =   ["0.0.0.0/0"]
  from_port             =   80
  to_port               =   80
  protocol              =   "tcp"
  security_group_id     =   aws_security_group.web.id
  type                  =   "ingress"
}
