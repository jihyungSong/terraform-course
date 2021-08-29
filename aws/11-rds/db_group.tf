resource "aws_db_subnet_group" "example" {
  name                  =   var.name
  subnet_ids            =   data.aws_subnet_ids.all.ids
  
  tags = {
    Name = var.name
  }
}

resource "aws_db_option_group" "example" {
  name                  =    var.name
  engine_name           =    var.engine_name
  major_engine_version  =    var.major_engine_version

  tags = {
    Name = var.name
  }

  option {
    option_name         =   "MARIADB_AUDIT_PLUGIN"

    option_settings {
      name              =   "SERVER_AUDIT_EVENTS"
      value             =   "CONNECT"
    }
  }
}

resource "aws_db_parameter_group" "example" {
  name                  =   var.name
  family                =   var.family

  tags = {
    Name                =   var.name
  }

  parameter {
    name                =   "general_log"
    value               =   "0"
  }
}