provider "aws" {
  region  = "ap-south-1"
  profile = "Terraform-Practice-Role"
}

resource "aws_instance" "terraform_ec2" {
  ami           = "ami-0fc5120b2d80d4749"
  instance_type = "t3.micro"
  tags = {
    Name = "Terraform-Practice-EC2"
  }
}