provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAU2KZILZSMG6VIQV2"
  secret_key = "BO6Uk4Ce8zcb3mZ1fbdKxvhc6Tjwbl+YRG6du3az"
  region     = "ap-south-1"
}
resource "aws_instance" "example" {
  ami = "ami-05dbd1926bfb06723"
  tags = {
    Name = "Windows-instance"
  }
  instance_type   = "t2.micro"
  key_name        = "terraform_windows"
  security_groups = ["${aws_security_group.allow_rdp.name}"]
}
resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "allow rdp traffic"

  ingress {
    from_port = 3389 # by default, windows server listens to TCP port 3389 for RDP
    to_port   = 3389
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}
