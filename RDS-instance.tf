resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "app-DB-Taha"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "root"
  password             = "P@ssw0rd"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = "db-subgroup"
  multi_az = true

  port = 3306
  vpc_security_group_ids = [aws_security_group.RDS_sg.id]
}


resource "aws_db_subnet_group" "sub-gr" {
  name       = "db-subgroup"
  subnet_ids = [aws_subnet.create-subnet["private-subnet-1"].id, aws_subnet.create-subnet["private-subnet-2"].id]

  tags = {
    Name = "subnet-group"
  }
}



resource "aws_security_group" "RDS_sg" {
  name_prefix = "example_sg"
  description = "Example Security Group"
  ingress {
    description      = "RDS"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks = ["10.0.0.0/16"]

  }
  
  tags = {
    Name = "RDS-SecGroup"
  }
  
}