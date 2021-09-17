variable "prefix" {}

variable "subnet_ids" {
    type        =   list
}

variable "instance_type" {
    default     =   "t3.small"
}

variable "keypair_name" {}
variable "security_groups" {}
variable "img_url" {}