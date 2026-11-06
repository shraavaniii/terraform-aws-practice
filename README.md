# Terraform Practice – Launch an EC2 Instance on AWS

## Goal
Learn the basic Terraform workflow by creating and deleting one EC2 instance on AWS.

## What I built
One `t3.micro` EC2 instance (Ubuntu 24.04) in `ap-south-1` (Mumbai), created and destroyed with Terraform. This is a beginner practice exercise.

## Files
- `main.tf` – AWS provider and the EC2 resource
- `.gitignore` – keeps state files out of Git

## main.tf
```hcl
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
```

## Commands I ran
| Command | Purpose |
|---|---|
| `terraform init` | Download the AWS provider |
| `terraform fmt` | Fix code formatting |
| `terraform validate` | Check the code for errors |
| `terraform plan` | Preview what will be created |
| `terraform apply` | Create the instance |
| `terraform destroy` | Delete the instance |

## Problem I faced: UnauthorizedOperation
- **What happened:** `aws ec2 run-instances --dry-run` failed with `UnauthorizedOperation` on `network-interface/*`.
- **Cause:** My custom IAM policy allowed `RunInstances` only when `ec2:InstanceType = t3.micro`, with `Resource: "*"`. AWS checks permission for each resource a launch touches, and the instance-type condition does not match the network interface.
- **Fix:** I split `RunInstances` into two statements: one for the instance (with the `t3.micro` condition) and one for the supporting resources (image, network interface, volume, subnet, security group, key pair).
- **Lesson:** `--dry-run` tests permissions without creating or paying for anything.

## Other lesson
The Console showed no instance because it was set to the wrong region (Virginia). Always check the region first.

## Cost safety
I ran `terraform destroy` right after `apply` and confirmed the instance showed `terminated` in the Console.

## Limits of this exercise
- The AMI ID is hardcoded.
- No security group or SSH access.
- No variables or outputs.
- State is stored locally.

## Next steps
Outputs, variables, security group and SSH.
