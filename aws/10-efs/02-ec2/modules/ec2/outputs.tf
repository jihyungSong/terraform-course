output "webserver_instances_ids" {
    description     =   "The list of EC2 Instance ID as web servers"
    value           =   aws_instance.webserver.*.id
}

output "webserver_instances_public_ips" {
    description     =   "The list of public IP address of EC2 Instance ID as web servers"
    value           =   aws_instance.webserver.*.public_ip
}

output "webserver_instances_private_ips" {
    description     =   "The list of private IP address of EC2 Instance ID as web servers"
    value           =   aws_instance.webserver.*.private_ip
}
