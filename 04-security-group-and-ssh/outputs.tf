output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.terraform_ec2.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.terraform_ec2.public_ip
}

output "ssh_command" {
  description = "Command to log in"
  value       = "ssh -i ~/.ssh/terraform-practice ubuntu@${aws_instance.terraform_ec2.public_ip}"
}
