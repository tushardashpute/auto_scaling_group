# rds.tf

locals {
  resource_name_prefix = var.env
}

resource "aws_db_subnet_group" "subnet_group" {
  subnet_ids = [aws_subnet.subnet.id, aws_subnet.subnet1.id]
}


resource "aws_db_instance" "rds" {

  allocated_storage       = 10
  storage_type                = "gp2"
  backup_retention_period = 1
  db_subnet_group_name    = aws_db_subnet_group.subnet_group.id
  engine                  = "mysql"
  engine_version          = "8.0.15"
  instance_class          = "db.t2.micro"
  name                    = "myrdstestmysql"
  username                = "admin"
  password                = "admin123"
  port                    = 3306
  publicly_accessible     = true
  storage_encrypted       = false
  skip_final_snapshot     = true
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  vpc_security_group_ids = [aws_security_group.ec2.id]

 
}
