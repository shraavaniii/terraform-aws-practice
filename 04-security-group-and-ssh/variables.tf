variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "my_ip_cidr" {
  description = "My public IP in CIDR form, for SSH access"
  type        = string
}

variable "public_key_path" {
  description = "Path to my SSH public key"
  type        = string
  default     = "~/.ssh/terraform-practice.pub"
}
