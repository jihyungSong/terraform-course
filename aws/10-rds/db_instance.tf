resource "aws_db_instance" "example" {
  identifier             = var.name
  engine                 = var.engine_name
  engine_version         = var.engine_version
  port                   = var.port
  name                   = var.database_name
  username               = var.username
  password               = var.password
  instance_class         = "db.t2.micro"
  allocated_storage      = var.allocated_storage
  skip_final_snapshot    = true
  license_model          = var.license_model
  db_subnet_group_name   = aws_db_subnet_group.example.id
  vpc_security_group_ids = [aws_security_group.db_instance.id]
  publicly_accessible    = true
  parameter_group_name   = aws_db_parameter_group.example.id
  option_group_name      = aws_db_option_group.example.id

  tags = {
    Name = var.name
  }
}
