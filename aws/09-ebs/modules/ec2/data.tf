data "template_file" "webserver_init" {
    template = file("${path.module}/templates/userdata.sh.tpl")
}
