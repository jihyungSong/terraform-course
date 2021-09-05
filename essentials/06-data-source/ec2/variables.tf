variable "prefix" {
    description     =   "Value to be used for prefix of tag"
    type            =   string
}

variable "region" {
    description     =   "Region code to use"
    type            =   string
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