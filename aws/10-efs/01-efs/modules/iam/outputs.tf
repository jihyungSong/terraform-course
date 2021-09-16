output "efs_iam_role_name" {
    description     =   "The Name of IAM Role for access EFS"
    value           =   aws_iam_role.this.name
}

output "efs_iam_policy_arn" {
    description     =   "The ARN of IAM Policy for access EFS"
    value           =   aws_iam_policy.this.arn
}

output  "ec2_iam_profile_name" {
    description     =   "The Name of IAM Instance Profile for access EFS"
    value           =   aws_iam_instance_profile.this.name
}