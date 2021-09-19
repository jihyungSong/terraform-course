variable "prefix" {}
variable "region" {}

variable "vpc_cidr" {}
variable "public_subnets" {
    type = list(object({
        cidr                =   string
        availability_zone   =   string
    }))
}

variable "private_subnets" {
    type = list(object({
        cidr                =   string
        availability_zone   =   string
    }))
}

variable "admin_access_cidrs" {
    type = list(string)
}
variable "ami_id" {}
variable "data_vol_snapshot_id" {}
variable "data_volume_size" {}
variable "instance_type" {}
variable "keypair_name" {}

variable "port" {}
variable "protocol" {}
