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

variable "ssh_cidrs" {
    type = list(string)
}