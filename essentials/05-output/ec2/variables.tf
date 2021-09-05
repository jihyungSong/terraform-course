variable "prefix" {
    description     =   "Value to be used for prefix of tag"
    type            =   string
}

variable "region" {
    description     =   "Region code to use"
    type            =   string
}

variable "ami_id" {
    description     =   "The ID of AMI for provisioning instance"
    type            =   string
    
    validation {
        condition       =   can(regex("^ami-", var.ami_id))
        error_message   =   "Invalid AMI ID."
    }
}

variable "instance_type" {
    description     =   "The type of the instance to be deployed"
    type            =   string
}

variable "keypair_name" {
    description     =   "Keypair's name to connect to the instance"
    type            =   string
    
    sensitive       =   true
}