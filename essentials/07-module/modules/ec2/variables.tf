variable "prefix" {
    description     =   "Value to be used for prefix of tag"
    type            =   string
}

variable "subnet_id" {
    description     =   "The ID of the subnet where the instance will be deployed"
    type            =   string
}

variable "instance_type" {
    description     =   "The type of the instance to be deployed"
    type            =   string
}

variable "keypair_name" {
    description     =   "Keypair's name to connect to the instance"
    type            =   string
}

variable "security_group_ids" {
    description     =   "List of security group IDs to apply to instance"
    type            =   list(string)
}