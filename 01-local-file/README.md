# 01 – Local File with Terraform



## Goal

Learn Terraform basics before using any cloud.



## What I built

A text file (`hello.txt`) created and deleted by Terraform with the `local` provider. No AWS was involved.



## main.tf

```hcl

resource "local_file" "demo" {

  filename = "hello.txt"

  content  = "Hello! This is my first Terraform exercise."

}

```

- `local_file` is the resource type, from the `local` provider.

- `demo` is the name Terraform uses for this resource inside the code.

- `filename` is the file to create, in the folder where I run Terraform.

- `content` is the text written into the file.



## Commands I ran

`terraform init`, `plan`, `apply`, `state list`, `plan -destroy`, `destroy`



## What I learned

- A provider is the plugin that lets Terraform manage something (here, local files).

- A resource describes one thing to create.

- Terraform records what it created in state, and `terraform state list` shows it.

- `plan -destroy` previews a deletion before `destroy` does it.



## Limits

- Local files only, with no cloud.

- No variables or outputs. Exercise 03 covers those.

