# Terraform Practice 03 – Variables and Outputs

## Goal
Learn Terraform variables and outputs by building on my earlier EC2 exercise (02).

## What I built
The same `t3.micro` Ubuntu EC2 instance in `ap-south-1` (Mumbai), created and destroyed with Terraform. The code now uses variables, and Terraform prints the instance ID and public IP after `apply`.

## Previous Exercise (02): Basic EC2 Creation

The first exercise involved creating and deleting one EC2 instance using Terraform.

### What I learned
- The basic Terraform workflow: init, fmt, validate, plan, apply and destroy.
- AWS region selection matters; the Console initially showed no instance because it was set to Virginia instead of Mumbai.
- `terraform destroy` removes the created instance.

### Problem faced: UnauthorizedOperation
- `aws ec2 run-instances --dry-run` failed with `UnauthorizedOperation` on `network-interface/*`.
- My custom IAM policy restricted `RunInstances` to `t3.micro`, but AWS also checked permissions for supporting resources.
- I split the policy into separate statements for the instance and supporting resources.
- `--dry-run` tests permissions without actually creating an instance.

## Exercise 03: Variables and Outputs

### Files
- `variables.tf` – settings: region and instance type
- `main.tf` – AWS provider and EC2 resource, using `var.region` and `var.instance_type`
- `outputs.tf` – prints `instance_id` and `public_ip` after `apply`
- `.gitignore` – keeps provider downloads and state files out of Git

### Commands I ran
`terraform init`, `terraform fmt`, `terraform validate`, `terraform plan`, `terraform apply`, `terraform output`, `terraform destroy`

### Problem I faced
Windows blocked `terraform.exe` because its publisher couldn't be verified. Smart App Control was On. I installed Ubuntu in WSL2 and ran Terraform there instead, without turning off a security setting.

### What I learned
- Variables keep settings in one place instead of hardcoding them in `main.tf`.
- Outputs print useful values like the instance ID and public IP after `apply`.
- Running `apply` again without changing the configuration makes no changes.
- A variable can accept values that my IAM policy still refuses. My policy only allows `t3.micro` in `ap-south-1`.

## Limits of the current exercise
- The AMI ID is hardcoded.
- No security group or SSH access.
- State is stored locally.

## Next steps
Security group and SSH.
