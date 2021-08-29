variable "prefix" {}
variable "region" {}

variable "vpc_id" {}

variable "port" {
    default     =   80
}

variable "protocol" {
    default     =   "HTTP"
}

variable "security_groups" {
    type        =   list(string)
}
variable "subnet_ids" {
    type        =   list(string)
}