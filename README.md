# Terraform Practice 03 – Variables and Outputs

## Goal
Learn Terraform variables and outputs by building on my EC2 exercise (02).

## What I built
The same `t3.micro` Ubuntu EC2 instance in `ap-south-1`, created and destroyed with Terraform. The code now uses variables, and Terraform prints the instance ID and public IP after `apply`. This is a beginner practice exercise.

## Files
- `variables.tf` – settings: region and instance type
- `main.tf` – AWS provider and the EC2 resource, reading the settings with `var.region` and `var.instance_type`
- `outputs.tf` – prints `instance_id` and `public_ip` after `apply`
- `.gitignore` – keeps provider downloads and state files out of Git

## Commands I ran
`terraform init`, `fmt`, `validate`, `plan`, `apply`, `output`, `destroy`

## Problem I faced
Windows blocked `terraform.exe` ("publisher can't be verified"). Smart App Control was On. I installed Ubuntu in WSL2 and ran Terraform there instead, without turning any security setting off.

## What I learned
- Variables keep settings in one place instead of hardcoded in `main.tf`.
- Outputs print useful values (like the instance ID) after `apply`.
- `apply` twice with no code change makes no changes.
- A variable can accept values my IAM policy still refuses (my policy only allows `t3.micro` in `ap-south-1`).

## Limits of this exercise
- The AMI ID is hardcoded.
- No security group or SSH access.
- State is stored locally.

## Next steps
Security group and SSH.
