variable "prefix" {}

variable "subnet_ids" {
    type        =   list
}

variable "instance_type" {
    default     =   "t3.small"
}

variable "ami_id" {}
variable "keypair_name" {}
variable "iam_profile_name" {}
variable "security_groups" {
    type        =   list(string)
}