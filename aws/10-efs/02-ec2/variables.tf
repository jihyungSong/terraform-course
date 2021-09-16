variable "prefix" {}
variable "region" {}


variable "public_subnet_ids"{
    type    =   list(string)
}

variable "instance_type" {}
variable "ami_id" {}
variable "keypair_name" {}

variable "security_group_ids"{
    type    =   list(string)
}

variable "iam_profile_name" {}
