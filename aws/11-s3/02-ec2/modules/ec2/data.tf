data "template_file" "webserver_init" {
    template = file("${path.module}/templates/userdata.sh.tpl")
    
    vars = {
        img_url = var.img_url
    }
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]   # Canonical
}