resource "aws_instance" "test_instance" {
  ami = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-0b4f16616069ba652" ]
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update
              sudo yum install -y httpd
              sudo echo "<center><h2> HELLO BRO! </h2></center>" | sudo tee /var/www/html/index.html
              sudo systemctl start httpd
              EOF
}

output "ip" {
  value = aws_instance.test_instance.public_ip
}