variable "prefix" {}

variable "subnet_ids" {
    type    =   list(string)
}

variable "security_groups" {
    type    =   list(string)
}