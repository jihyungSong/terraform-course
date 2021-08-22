output "webserver_ids" {
    value       =   aws_instance.webserver.*.id
}

output "webserver_public_ips" {
    value       =   aws_instance.webserver.*.public_ip
}

output "webserver_privater_ips" {
    value       =   aws_instance.webserver.*.private_ip
}