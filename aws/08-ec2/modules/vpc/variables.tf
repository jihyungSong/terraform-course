variable "prefix" {}
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