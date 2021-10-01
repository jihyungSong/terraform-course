variable "prefix" {}

variable "subnet_ids" {
    type        =   list(string)
}

variable "instance_type" {
    default     =   "t3.small"
}

variable "keypair_name" {}
variable "security_groups" {
    type        =   list(string)
}