provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demoInstance" {
  ami = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  subnet_id = "subnet-04429a62f1f16a14f"
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update
              sudo yum install -y httpd
              sudo echo "<center><h2> WELCOME TO MY SITE! </h2></center>" | sudo tee /var/www/html/index.html
              sudo systemctl start httpd
              EOF

  security_groups = ["sg-0b4f16616069ba652"]

  tags = {
    Name = "terraform-example"
  }
}


resource "aws_security_group" "Instance-Sg" {
  name = "demo-sg-test"
  vpc_id = "vpc-013feb576ac0611b3"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    name = "tf-sg"
  }
}