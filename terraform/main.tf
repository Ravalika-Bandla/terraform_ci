provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "frontend" {
  ami           = "ami-0dd574ef87b79ac6c"
  instance_type = "t3.micro"
  key_name      = "newaws"

  tags = {
    Name = "c8.local"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/frontend_ip.txt"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-04542995864e26699"
  instance_type = "t3.micro"
  key_name      = "newaws"

  tags = {
    Name = "u21.local"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/backend_ip.txt"
  }
}
