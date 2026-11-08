provider "aws" {
  region  = var.region
  profile = "Terraform-Practice-Role"
}

resource "aws_instance" "terraform_ec2" {
  ami           = "ami-0fc5120b2d80d4749"
  instance_type = var.instance_type
  tags = {
    Name = "Terraform-Practice-EC2"
  }
}
