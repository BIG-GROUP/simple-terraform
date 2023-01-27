provider "aws" {
  region = "ap-southeast-3"
}

resource "aws_instance" "example" {
  ami           = "ami-0f65671a86f061fcd"
  instance_type = "t2.micro"

  tags = {
    Name = "my-ec2-instance"
  }
}

resource "aws_eip" "example" {
  vpc = true
}

resource "aws_eip_association" "example" {
  instance_id = aws_instance.example.id
  eip         = aws_eip.example.id
}
