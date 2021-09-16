output "webserver_instances_ids" {
    description     =   "The list of EC2 Instance ID as web servers"
    value           =   module.webserver.webserver_instances_ids
}

output "webserver_instances_public_ips" {
    description     =   "The list of public IP address of EC2 Instance ID as web servers"
    value           =   module.webserver.webserver_instances_public_ips
}

output "webserver_instances_private_ips" {
    description     =   "The list of private IP address of EC2 Instance ID as web servers"
    value           =   module.webserver.webserver_instances_private_ips
}
