variable "prefix" {}
variable "region" {}

variable "image_id" {}
variable "instance_type" {}
variable "keypair_name" {}
variable "security_group_ids" {
    type    =   list(string)
}

variable "iam_instance_profile_arn" {}

variable "subnet_ids" {
    type    =   list(string)
}

variable "max_size" {}
variable "min_size" {}
variable "desired_capacity" {}
variable "target_group_arns"

variable "health_check_type" {}
variable "health_check_grace_period" {}