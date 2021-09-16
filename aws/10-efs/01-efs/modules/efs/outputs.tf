output "efs_filesystem_id" {
    description     =   "The ID of EFS filesystem"
    value           =   aws_efs_file_system.this.id
}
