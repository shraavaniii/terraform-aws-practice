# Terraform Learning

Hands-on Terraform practice on AWS. Each exercise has its own folder with its own code and README. This page holds the general notes I collect as I learn.

## Exercises
| Folder | What I practiced |
|---|---|
| [01-local-file](./01-local-file) | Create and destroy a local text file with the `local` provider (no AWS) |
| [02-terraform-and-aws-integration](./02-terraform-and-aws-integration) | Create and destroy one EC2 instance, IAM role and custom policy |
| [03-variables-and-outputs](./03-variables-and-outputs) | Variables and outputs on the same EC2 code |

## Exercise 01: Local file (no AWS)
My first exercise, done before using any cloud. I used the `local` provider to create a text file with Terraform, then deleted it. It has no folder in this repo because it only creates a local file.

```hcl
resource "local_file" "demo" {
  filename = "hello.txt"
  content  = "Hello! This is my first Terraform exercise."
}
```
- `local_file` is the resource type, from the `local` provider.
- `demo` is the name Terraform uses for this resource inside the code.
- `filename` is the file to create. It is created in the folder where I run Terraform.
- `content` is the text written into the file.

Commands I ran: `terraform init`, `plan`, `apply`, `state list`, `destroy`

What I learned:
- A provider is the plugin that lets Terraform manage something (here, local files).
- A resource describes one thing to create.
- Terraform records what it created in state, and `terraform state list` shows it.
- `plan -destroy` previews a deletion before `destroy` does it.

## My setup
- AWS CLI profile that uses an IAM role
- Region: `ap-south-1` (Mumbai)
- Terraform runs inside WSL2 Ubuntu on Windows

## Terraform basics (my notes)
- Terraform is Infrastructure as Code: I describe what I want in `.tf` files and Terraform builds it.
- Terraform reads every `.tf` file in a folder together. Common names are `main.tf`, `variables.tf` and `outputs.tf`.
- `terraform.tfstate` records what Terraform built. It must never be committed.

| Command | Use |
|---|---|
| `terraform init` | Download the provider (first time in a folder) |
| `terraform fmt` | Fix code formatting |
| `terraform validate` | Check the code for errors |
| `terraform plan` | Preview changes (read-only) |
| `terraform apply` | Create or change resources (can cost money) |
| `terraform output` | Show the output values |
| `terraform state list` | List resources Terraform tracks |
| `terraform destroy` | Delete everything Terraform created |

## Safe practice rules
- Run `plan` before `apply`.
- Destroy practice resources in the same sitting, then confirm `terminated` in the correct region.
- `aws ec2 run-instances --dry-run` tests EC2 permissions without creating anything.
- Never commit `.terraform/`, `*.tfstate` or AWS credentials.

## Troubleshooting log
- **Console shows no instance:** check the region at the top right.
- **`UnauthorizedOperation` on `RunInstances`:** an instance-type condition also applied to the supporting resources, so I split the policy into two statements.
- **Windows blocked `terraform.exe`:** Smart App Control was On, so I ran Terraform in WSL2 Ubuntu instead.

## Next
Security group and SSH.
