resource "aws_iam_policy" "this" {
    name                  = "${var.prefix}-ec2-efs-access-policy"
    description           = "EC2 EFS Client Access Policy"
    policy                = file("${path.module}/policies_json/efs-access-policy.json")
  
    tags = {
        Name            =   "${var.prefix}-ec2-efs-access-policy"
        Managed_by      =   "terraform"
    }
}

resource "aws_iam_role" "this" {
    name                =   "${var.prefix}-efs-role"
    assume_role_policy  =   file("${path.module}/policies_json/assume_role.json")
    
    tags = {
        Name            =   "${var.prefix}-efs-role"
        Managed_by      =   "terraform"
    }
}

resource "aws_iam_role_policy_attachment" "this" {
    role                =   aws_iam_role.this.name
    policy_arn          =   aws_iam_policy.this.arn
}

resource "aws_iam_instance_profile" "this" {
  name                  =   "${var.prefix}-profile"
  role                  =   aws_iam_role.this.name
}
