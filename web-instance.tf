

resource "aws_instance" "example" {
  ami           = "ami-0f3c9c466bb525749"
  instance_type = "t2.micro"
  
  subnet_id      = aws_subnet.public["public-subnet"].id
  key_name      = "mykey"
  
  # Attach to security group
  vpc_security_group_ids = [aws_security_group.example.id]

  tags = {
    Name = "taha-instance-web"
  }
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Allow traffic to ports 80 and 443"
 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "taha-secgroup1-webinstance"
  }
}



terraform {
    backend "s3" {
    bucket = "taha-bucket-s3-iti"
    key    = "terraformlab/terraform-taha-statefile"
    region = "us-east-2"
  }
}