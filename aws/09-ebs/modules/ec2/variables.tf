variable "prefix" {}

variable "subnet_ids" {
    type        =   list
}

variable "instance_type" {
    default     =   "t3.small"
}

variable "ami_id" {}
variable "data_vol_snapshot_id" {}
variable "keypair_name" {}
variable "security_groups" {}
variable "data_volume_size" {
    description =   "The size of the EBS data volume to attach to the instance (GiB)"
}