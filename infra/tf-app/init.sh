#! /bin/bash

# Initialize the Terraform app
terraform init

# Format the Terraform code
terraform fmt
terraform validate

# Plan the changes
terraform plan --out=tf-app.plan
terraform apply tf-app.plan