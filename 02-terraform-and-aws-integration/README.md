\# 02 – Terraform and AWS Integration



\## Goal

Learn the basic Terraform workflow by creating and deleting one EC2 instance.



\## What I built

One `t3.micro` Ubuntu EC2 instance in `ap-south-1` (Mumbai), created and destroyed with Terraform, connected through an IAM role.



\## Files

\- `main.tf` – AWS provider and the EC2 resource (values typed directly in the code)

\- `screenshots/` – apply, instance created, destroy, instance terminated



\## Commands I ran

`terraform init`, `fmt`, `validate`, `plan`, `apply`, `destroy`



\## Problem I faced: UnauthorizedOperation

\- `aws ec2 run-instances --dry-run` failed on `network-interface/\*`.

\- My custom IAM policy limited `RunInstances` to `t3.micro`, but AWS also checked permissions for supporting resources.

\- I split the policy into separate statements for the instance and the supporting resources.



\## What I learned

\- The basic workflow: init, fmt, validate, plan, apply, destroy.

\- Region matters: the Console showed nothing because it was set to Virginia.

\- `--dry-run` tests permissions without creating anything.



\## Limits

\- Hardcoded AMI ID and settings.

\- No security group or SSH.

\- State is stored locally.

