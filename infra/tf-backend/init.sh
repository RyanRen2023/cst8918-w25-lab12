#! /bin/bash
az login

az group create --name ren00055-cst8918-tf-backend --location canadacentral

az storage account create \
--name ren00055tfstorage \
--resource-group ren00055-cst8918-tf-backend \
--location canadacentral --sku Standard_LRS

az storage container create --name tfstate --account-name ren00055tfstorage

# Initialize the Terraform backend
terraform init

# Format the Terraform code
terraform fmt

# Validate the Terraform code
terraform validate

# Plan the changes
terraform plan --out=tf-backend.plan

# Apply the changes
terraform apply tf-backend.plan