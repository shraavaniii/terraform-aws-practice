\# 03 – Variables and Outputs



\## Goal

Learn Terraform variables and outputs by building on exercise 02.



\## What I built

The same `t3.micro` Ubuntu EC2 instance in `ap-south-1`, created and destroyed with Terraform. The settings now live in variables, and Terraform prints the instance ID and public IP after `apply`.



\## Files

\- `variables.tf` – region and instance type

\- `main.tf` – provider and EC2 resource, using `var.region` and `var.instance\_type`

\- `outputs.tf` – prints `instance\_id` and `public\_ip`



\## Commands I ran

`terraform init`, `fmt`, `validate`, `plan`, `apply`, `output`, `destroy`



\## Problem I faced

Windows blocked `terraform.exe` because its publisher couldn't be verified, and Smart App Control was On. I installed Ubuntu in WSL2 and ran Terraform there, without turning off a security setting.



\## What I learned

\- Variables keep settings in one place instead of hardcoding them.

\- Outputs print useful values after `apply`.

\- Running `apply` again with no changes makes no changes.

\- A variable can accept values my IAM policy still refuses (it only allows `t3.micro` in `ap-south-1`).



\## Limits

\- Hardcoded AMI ID.

\- No security group or SSH.

\- State is stored locally.

