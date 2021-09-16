resource "aws_efs_file_system" "this" {
    creation_token      =   "${var.prefix}-filesystem"
    encrypted           =   true
    
    tags = {
        Name            =   "${var.prefix}-filesystem"
        Managed_by      =   "terraform"
    }
}

resource "aws_efs_mount_target" "alpha" {
    count               =   length(var.subnet_ids)
    
    file_system_id      =   aws_efs_file_system.this.id
    subnet_id           =   var.subnet_ids[count.index]
    security_groups     =   var.security_groups
}