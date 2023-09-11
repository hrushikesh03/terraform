provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAU2KZILZSMG6VIQV2"
  secret_key = "BO6Uk4Ce8zcb3mZ1fbdKxvhc6Tjwbl+YRG6du3az"
  region     = "ap-south-1"
}
resource "aws_instance" "example" {
  ami = "ami-02bb7d8191b50f4bb"
  tags = {
    Name = "Linux-instance"
  }
  instance_type   = "t2.micro"
  key_name        = "terraform-linux"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow ssh traffic"

  ingress {
    from_port = 22 # by default, linux server listens to TCP port 22 for SSH
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}
