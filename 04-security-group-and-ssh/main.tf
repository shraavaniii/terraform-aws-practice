provider "aws" {
  region  = var.region
  profile = "Terraform-Practice-Role"
}

resource "aws_key_pair" "practice" {
  key_name   = "terraform-practice-key"
  public_key = file(pathexpand(var.public_key_path))
}

resource "aws_security_group" "ssh" {
  name        = "terraform-practice-ssh"
  description = "Allow SSH from my IP only"

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terraform_ec2" {
  ami                    = "ami-0fc5120b2d80d4749"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.practice.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name = "Terraform-Practice-EC2"
  }
}
