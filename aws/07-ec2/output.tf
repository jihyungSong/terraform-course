output "webserver_instances_ids" {
    value       =   aws_instance.webserver.*.id
}

output "webserver_instances_public_ips" {
    value       =   aws_instance.webserver.*.public_ip
}

output "webserver_instances_private_ips" {
    value       =   aws_instance.webserver.*.private_ip
}